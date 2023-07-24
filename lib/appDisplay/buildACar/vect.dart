

import 'package:buildacar/appDisplay/buildACar/painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

/// Class shows the build your own car page to the user.
/// This is where they chose the model, color of the car.


class Build extends StatefulWidget{

  late String imageBytes;

  Build(String path, {super.key}){
    imageBytes = path;
  }

  @override
  State<Build> createState() => _Build();
}

class _Build extends State<Build> {


  String colorCode = '';

  @override
  Widget build(BuildContext context) {

    String imageBytes = widget.imageBytes;
    if(imageBytes.contains('#F9CC3D')){
      imageBytes.replaceAll('#F9CC3D', '\$color');
    }
    if(imageBytes.contains('#FFF35A')){
      imageBytes.replaceAll('#FFF35A', '\$shade');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Build Your Own Car"),
        backgroundColor: Colors.lightBlue,
      ),
      body: SafeArea(
          child: Column(children: [
              Expanded(
                  child: Painter(
                      color: colorCode.isNotEmpty
                          ? colorCode.split('.')[1].split(':')[0]
                          : '#bdd4de',
                      shade: colorCode.isNotEmpty
                          ? colorCode.split('.')[1].split(':')[1]
                          : '#3f5765',
                    imageBytes: widget.imageBytes!,),
              ),
              Text("Choose your color: ",
                style: TextStyle(fontWeight: FontWeight.bold, ),),
              Flexible(
                  child: SizedBox(
                    height: 80,
                    child: SVGColorSlider(
                      onColorSelected: (color) => setState(() => colorCode = color),
                    ),
                  )
              ),
            ])
      )
      );
  }






}