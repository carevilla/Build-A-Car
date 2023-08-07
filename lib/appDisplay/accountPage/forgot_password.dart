/// @author Christian Revilla
/// @author Leila Martinez

import 'package:buildacar/appDisplay/accountPage/utils.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
This class takes care of sending an email to the user to change their password
Source: https://www.youtube.com/watch?v=4vKiJZNPhss
*/

/// Stateful Widget to show ForgotPasswordPage
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});
   // creates subpage

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPage();

}

class _ForgotPasswordPage extends State<ForgotPasswordPage>{  // contains forgot your password widget

  final emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();       // a formkey that is used to save the submitted data of the user.


  /** Function that disposes the previously saved TextField email
   * @return void
   */
  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }

  /** Build Function to display the reset password widget
   * Also validates email and password are valid
   * @return Widget that displays reset password build
   * @param BuildContext context
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reset Password'), centerTitle: true, backgroundColor: Colors.lightBlue,),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Receive an email to reset password",
                style: TextStyle(color: Colors.black, fontSize: 18),),
              const Divider(height: 20, color: Colors.white,),
              TextFormField(                                        // creates the blank space where the user can write into
                controller: emailController,
                cursorColor: Colors.black,
                keyboardType: TextInputType.emailAddress,           // It also calls a validator to make user that the username is greater than 0 and a valid email
                validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? ("Enter Valid Email")
                    : null,
                decoration: const InputDecoration(                 // hints the user of what the field is asking for
                  hintText: "none@none.com",
                  labelText: "eMail address",
                ),
              ),
              const Divider(height: 20, color: Colors.white),
              ElevatedButton.icon(                                               // This button will submit email where the user wants to reset password.
                style: ElevatedButton.styleFrom(primary: Colors.indigo,
                    minimumSize: const Size.fromHeight(40)),
                icon: const Icon(Icons.email_outlined),
                label: const Text(
                  'Reset Password',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: resetPassword,
              )
            ],
          ),
        ),
      ),
    );
  }

  /** Function to send Firbase a reset password to specify email to account
   * @return Future representing a dialog box of either a progress indicator
   * or status of email sent
   * @throw Excpetion via SnackBar displaying error message
   */
  Future resetPassword() async { // Firebase Sends reset password to email provided by user
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator(color: Colors.lightBlue,),)
    );
    
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      UtilsAccount.showSnackBar("Password Reset Email was Sent!");   // Displays message to user that action was taken
      Navigator.of(context).popUntil((route) => route.isFirst);

    } on FirebaseAuthException catch (e){
      UtilsAccount.showSnackBar(e.message);// Displays error message
      Navigator.of(context).pop();
    }
  }
}