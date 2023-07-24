
import 'package:buildacar/appDisplay/accountPage/login_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'logAuth.dart';

///Class takes care of the account page. This includes the signIn, SignOut pages.

class Account extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _Account();
}

class _Account extends State<Account>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Account", style: TextStyle(color: Colors.white,),),
        centerTitle: true,
      ),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){                /// user is already signed In displays sign out page
            return LoggedInW();
          } else {
            return LogAuth();                  /// shows sign in page that includes sign up and forgot password
          }

        }
      ),

    );
  }

}



