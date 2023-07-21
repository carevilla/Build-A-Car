

import 'package:buildacar/appDisplay/login_widgets.dart';
import 'package:buildacar/appDisplay/user_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

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
          if(snapshot.hasData){
            return LoggedInW();
          } else {
            return LoginW();
          }

        }
      ),
      bottomNavigationBar: Container(
        color: Colors.lightBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              icon: const Icon(Icons.home, color: Colors.white, size: 30,),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListPage()));
                },
                icon: const Icon(Icons.format_list_bulleted, color: Colors.white, size: 30,)),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Account()));
                },
                icon: const Icon(Icons.account_circle_rounded, color: Colors.white, size: 30))
          ],
        ),
      ),
    );
  }

}



