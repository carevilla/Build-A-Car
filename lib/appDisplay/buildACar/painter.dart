

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class Painter extends StatelessWidget{
  final String color, shade, imageBytes;

  Painter({required this.color, required this.shade, required this.imageBytes});


  @override
  Widget build(BuildContext context){
    debugPrint(imageBytes);
    return Container(
      padding: EdgeInsets.all(15),
      child: SvgPicture.string(imageBytes),
    );

  }
}