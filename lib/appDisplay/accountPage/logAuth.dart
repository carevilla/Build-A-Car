/// @author Christian Revilla
/// @author Leila Martinez

import 'package:buildacar/appDisplay/accountPage/sign_up.dart';
import 'package:flutter/cupertino.dart';

import 'login_widgets.dart';

/// Class takes care of showing what page the user is on,
/// allows easy transition to sign up and sign in pages.
class LogAuth extends StatefulWidget{

  @override
  State<LogAuth> createState() => _LogAuth();

}


class _LogAuth extends State<LogAuth> {
  bool isLogin = true;

  /** Buld function to display if user is logged in or not
   *  if user is logged in it shows logIn, if not shows sign up.
   *  @return Widget displaying login status
   *  @param BuildContext context
   */
  @override
  Widget build(BuildContext context) =>
      isLogin ? LoginW(onClickedSignIn: toggle) :
      SignUpW(onClickedSignUp: toggle);

  /// Function to set the state if user logged in or not
  void toggle()=> setState(() => isLogin = !isLogin);

}