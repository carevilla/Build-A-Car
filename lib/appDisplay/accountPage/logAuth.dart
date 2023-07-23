

import 'package:buildacar/appDisplay/accountPage/sign_up.dart';
import 'package:flutter/cupertino.dart';

import 'login_widgets.dart';

/*

Class takes care of showing what page the user is on,
allows easy transition to sign up and sign in pages.
 */
class LogAuth extends StatefulWidget{

  @override
  State<LogAuth> createState() => _LogAuth();

}


class _LogAuth extends State<LogAuth> {

  bool isLogin = true;


  @override
  Widget build(BuildContext context) =>
      isLogin ? LoginW(onClickedSignIn: toggle) : SignUpW(onClickedSignUp: toggle);        // if user is logged in it shows logIn, if not shows sign up.

  void toggle()=> setState(() => isLogin = !isLogin);
}