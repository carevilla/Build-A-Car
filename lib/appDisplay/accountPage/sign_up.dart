
import 'package:buildacar/appDisplay/accountPage/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class SignUpW extends StatefulWidget{

  final Function() onClickedSignUp;

  const SignUpW({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key : key);

  @override
  State<SignUpW> createState() => _SignUpW();

}

class _SignUpW extends State<SignUpW> {


  final LoginData _loginData = LoginData();                           // creates an object of the Log in Class
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();       // a formkey that is used to save the submitted data of the user.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  void dispose(){
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
                if(inValue!.length < 6) {
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
                    signUp();
                  }
                },
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue.shade800)),
                child: const Text("Sign Up!", style: TextStyle(fontSize: 18, color: Colors.white),),
              ),
            ),
            Divider(height: 30, color: Colors.white,),
            RichText(
                text: TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 15),
                    text: 'Have an Account?   ',
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
                        text: 'Sign In!',
                        style: TextStyle(color: Colors.orange, decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
                      ),
                    ]
                )
            ),
          ],
        ),
      ),
    );


  }

  Future signUp() async {

    showDialog(
        context: this.context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator(color: Colors.lightBlue,),)
    );

    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);

      UtilsAccount.showSnackBar(e.message);
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