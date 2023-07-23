

import 'package:buildacar/appDisplay/buildACar/painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

/*
Class shows the build your own car page to the user.
This is where they chose the model, color of the car.
 */


class Build extends StatefulWidget{
  @override
  State<Build> createState() => _Build();
}

class _Build extends State<Build> {

  String colorCode = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Build Your Own Car"),
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
                          : '#3f5765')
              ),
              Expanded(
                  child: SVGColorSlider(
                    onColorSelected: (color) => setState(() => colorCode = color),
                  )
              ),
            ])
      )
      );
  }






}