

import 'package:buildacar/appDisplay/accountPage/sign_up.dart';
import 'package:flutter/cupertino.dart';

import 'login_widgets.dart';

class LogAuth extends StatefulWidget{

  @override
  State<LogAuth> createState() => _LogAuth();

}


class _LogAuth extends State<LogAuth> {

  bool isLogin = true;


  @override
  Widget build(BuildContext context) =>
      isLogin ? LoginW(onClickedSignIn: toggle) : SignUpW(onClickedSignUp: toggle);

  void toggle()=> setState(() => isLogin = !isLogin);
}