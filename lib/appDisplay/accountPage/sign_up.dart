/// @author Christian Revilla
/// @author Leila Martinez

import 'package:buildacar/appDisplay/accountPage/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../main.dart';

/** This class shows the Sign Up page, verifies that user set a correct email and
 *  password length, and signs user once they have created the account.
 */
class SignUpW extends StatefulWidget{

  final Function() onClickedSignUp;   // makes sure if the user is signed up

  const SignUpW({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key : key);

  @override
  State<SignUpW> createState() => _SignUpW();

}

class _SignUpW extends State<SignUpW> {
  final LoginData _loginData = LoginData();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  /** Function that disposes the previously saved TextField email and password
   * @return void
   */
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  /** Build function to ask for users credentials during the create account phase
   * @return Widget Build
   * @param BuildContext context
   */
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false, // checks this pops and back button does not cause problems
        child: Container(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(                                        // creates the blank space where the user can write into
                  controller: emailController,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.emailAddress,           // It also calls a validator to make user that the username is greater than 0
                  validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? ("Enter Valid Email")
                      : null,
                  onSaved: (String? inValue){                        // saves the submitted value from the user
                    _loginData.username = inValue!;
                  },
                  decoration: const InputDecoration(                 // hints the user of what the field is asking for
                    hintText: "none@none.com",
                    labelText: "Username (eMail address)",
                  ),
                ),
                TextFormField(                                       // creates the blank space where the user can write into
                  controller: passwordController,
                  cursorColor: Colors.black,
                  obscureText: true,
                  validator: (String? inValue) {                     // It also calls a validator to make user that the password is greater than 4
                    if(inValue!.length < 6) {
                      return "Password must be >= 4 in length";
                    }
                    return null;
                  },
                  onSaved: (String? inValue) {                      // saves the submitted value from the user
                    _loginData.password = inValue!;
                  },
                  decoration: const InputDecoration(                // hints the user of what the field is asking for
                    hintText: "Password",
                    labelText: "Password",
                  ),
                ),
                const SizedBox(height: 30,),                        // empty box to divide the textfields and the button
                ConstrainedBox(constraints: const BoxConstraints(minHeight: 30),
                  child: ElevatedButton(                                                  // submit button
                    onPressed: () async {
                      if(_formKey.currentState!.validate()) {                             // makes sure that text type is validated to the standards asked.
                        _formKey.currentState?.save();                                    // saves inputted values of user into the Log In class
                        signUp();
                      }
                    },
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue.shade800)),
                    child: const Text("Sign Up!", style: TextStyle(fontSize: 18, color: Colors.white),),
                  ),
                ),
                const Divider(height: 30, color: Colors.white,),
                RichText(                                                                 // This Shows a text button that leads user back to the sign in page.
                    text: TextSpan(
                        style: const TextStyle(color: Colors.black, fontSize: 15),
                        text: 'Have an Account?   ',
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
                            text: 'Sign In!',
                            style: const TextStyle(color: Colors.orange, decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
                          ),
                        ]
                    )
                ),
              ],
            ),
          ),
        )
    );
  }

  /** Sign in method that checks if user is in Firebase
   *  @return Future Dialog box that represents either progress indicator
   *  or email and password verification status
   * @throws FirebaseAuthException via SnackBar format
   */
  Future signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: Colors.lightBlue,)
          ,)
    );
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
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