import 'package:buildacar/appDisplay/accountPage/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import 'forgot_password.dart';


/*

This class takes care of loggin in a user by the Firebase Authorization, provides a way for user to sign up
and forget password.

Source: https://www.youtube.com/watch?v=4vKiJZNPhss

 */

class LoginW extends StatefulWidget {
  final VoidCallback onClickedSignIn;                         // shows sign up page or sign in page

  const LoginW ({
    Key? key,
    required this.onClickedSignIn,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() => _LoginW();

}

class _LoginW extends State<LoginW> {

  final LoginData _loginData = LoginData();                           // creates an object of the Log in Class
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();       // a formkey that is used to save the submitted data of the user.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose(){                                                 // disposes of typed text of the user after usage
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(                                        // creates the blank space where the user can write into
              controller: emailController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.emailAddress,           // It also calls a validator to make user that the username is greater than 0
              validator: (String? inValue){
                if(inValue?.length == 0){
                  return "Please enter username";
                }
                return null;
              },
              onSaved: (String? inValue){                        // saves the submitted value from the user
                this._loginData.username = inValue!;
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
                if(inValue!.length < 4) {
                  return "Password must be >= 4 in length";
                }
                return null;
              },
              onSaved: (String? inValue) {                      // saves the submitted value from the user
                this._loginData.password = inValue!;
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
                    signIn();
                  }
                },
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue.shade800)),
                child: const Text("Log In!", style: TextStyle(fontSize: 18, color: Colors.white),),
              ),
            ),
            Divider(height: 30, color: Colors.white,),
            GestureDetector(                                                          // test for forgot password that send user to forgot password page
              child: Text(
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
            Divider(height: 30, color: Colors.white,),
            RichText(                                                                     // text that takes user to sign up page
                text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 15),
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

  Future signIn() async {                                         // sign in method that checks if user is in Firebase

    showDialog(                                                   // shows loading indicator if user exist
        context: this.context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(color: Colors.lightBlue,),)
    );

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(                 // sign in with Firebase
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      UtilsAccount.showSnackBar(e.message);                                  // displays error message
    }

    navigatorKey.currentState!.popUntil((route)=> route.isFirst);
  }


}


class LoginData {                                             // Log in Class that contains username and password
  String username = "";
  String password = "";

  String get getUsername => username;
  String get getPassword => password;
}







class LoggedInW extends StatefulWidget {                           // class displays logged in Page, where the user can log out
  @override
  State<StatefulWidget> createState() => _LoggedInW();

}

class _LoggedInW extends State<LoggedInW> {

  final user = FirebaseAuth.instance.currentUser!;                        // has current user information

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle_sharp, size: 175,),
            Text("Signed in as:", style: TextStyle(fontSize: 16),),
            Text(user.email!, style: TextStyle(fontSize: 14),),
            SizedBox(height: 25,),
            ElevatedButton.icon(                                                 // sign out user from the app
              icon: Icon(Icons.arrow_back),
              label: Text("Log Out"),
              onPressed: () => FirebaseAuth.instance.signOut(),),
          ],
        ),
      ),
    );
  }

}



