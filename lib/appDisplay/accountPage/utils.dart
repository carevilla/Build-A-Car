

import 'package:flutter/material.dart';

///Class displays messages(including error messages) in the logIn, logOut, and Forgot Password Pages


class UtilsAccount {

   static final messengerKey = GlobalKey<ScaffoldMessengerState>();               ///global key to display snack bar messages

   static showSnackBar(String? text) {
    
    if(text == null) return;
    
    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.red,);

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
    
  }
  
}