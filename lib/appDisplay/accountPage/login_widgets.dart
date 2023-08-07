/// @author Christian Revilla
/// @author Leila Martinez

import 'package:buildacar/appDisplay/accountPage/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'forgot_password.dart';

/** This class takes care of loggin in a user by the Firebase Authorization,
 *  provides a way for user to sign up and forget password.
 *  Source: https://www.youtube.com/watch?v=4vKiJZNPhss
 */
class LoginW extends StatefulWidget {
  final VoidCallback onClickedSignIn;  // shows sign up page or sign in page

  const LoginW ({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() => _LoginW();

}

class _LoginW extends State<LoginW> {
  final LoginData _loginData = LoginData();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /** Function disposes of typed text of the user after usage
   * @return void
   */
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /** Main Build widget to display enter email and password for app
   * Contains TextFormField for user to enter response and validates it
   * Provides a button for user to submit response
   * @return Widget Build representing Login page
   * @param BuildContext context
   */
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.emailAddress,
              validator: (String? inValue){
                if(inValue!.isEmpty){
                  return "Please enter username";
                }
                return null;
              },
              onSaved: (String? inValue){
                _loginData.username = inValue!;
              },
              decoration: const InputDecoration(
                hintText: "none@none.com",
                labelText: "Username (eMail address)",
              ),
            ),
            TextFormField(
              controller: passwordController,
              cursorColor: Colors.black,
              obscureText: true,
              validator: (String? inValue) {
                if(inValue!.length < 4) {
                  return "Password must be >= 4 in length";
                }
                return null;
              },
              onSaved: (String? inValue) {
                _loginData.password = inValue!;
              },
              decoration: const InputDecoration(
                hintText: "Password",
                labelText: "Password",
              ),
            ),
            const SizedBox(height: 30,),
            ConstrainedBox(constraints: const BoxConstraints(minHeight: 30),
              child: ElevatedButton(
                onPressed: () async {
                  if(_formKey.currentState!.validate()) {
                    _formKey.currentState?.save();
                    signIn();
                  }
                },
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue.shade800)),
                child: const Text("Log In!", style: TextStyle(fontSize: 18, color: Colors.white),),
              ),
            ),
            const Divider(height: 30, color: Colors.white,),
            GestureDetector(
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.indigo,
                  fontSize: 17,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPasswordPage()));
              },
            ),
            const Divider(height: 30, color: Colors.white,),
            RichText(                                                                     // text that takes user to sign up page
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                  text: 'No Account?   ',
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignIn,
                      text: 'Sign up!',
                      style: const TextStyle(color: Colors.orange, decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
                    ),
                  ]
                ),
            ),
          ],
        ),
      ),
    );
  }

  /** Sign in method that checks if user is in Firebase
   *  @return Future Dialog box that represents either progress indicator
   *  or email and password verification status
   * @throws FirebaseAuthException via SnackBar format
   */
  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.lightBlue,),)
    );
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      UtilsAccount.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route)=> route.isFirst);
  }
}

/// Class representing the users credentials
class LoginData {
  String username = "";
  String password = "";

  /// Getters for LoginData class
  /// @return String representing username
  /// @return String representing password
  String get getUsername => username;
  String get getPassword => password;
}

class LoggedInW extends StatefulWidget {                           // class displays logged in Page, where the user can log out
  @override
  State<StatefulWidget> createState() => _LoggedInW();
}

class _LoggedInW extends State<LoggedInW> {
  final user = FirebaseAuth.instance.currentUser!;                        // has current user information

  /** Build Function that displays who the currently signed in user is
   * @return Widget showing the user that is logged in
   * @param BuildContext context
   */
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle_sharp, size: 175,),
            const Text("Signed in as:", style: TextStyle(fontSize: 16),),
            Text(user.email!, style: const TextStyle(fontSize: 14),),
            const SizedBox(height: 25,),
            ElevatedButton.icon(                                                 // sign out user from the app
              icon: const Icon(Icons.arrow_back),
              label: const Text("Log Out"),
              onPressed: () => FirebaseAuth.instance.signOut(),),
          ],
        ),
      ),
    );
  }

}



