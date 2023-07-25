

import 'package:buildacar/appDisplay/buildACar/painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

/// Class shows the build your own car page to the user.
/// This is where they chose the model, color of the car.


class Build extends StatefulWidget{

  String model ='';

  Build(String m){
    model = m;
  }

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
        backgroundColor: Colors.lightBlue,
      ),
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(15),
            children: [
                Container(
                  height: 130,
                  width: 150,
                  child: modelPaint()
                ),
                Text("Choose your color: ",
                  style: TextStyle(fontWeight: FontWeight.bold, ),),
                Container(
                    child: SizedBox(
                      height: 80,
                      child: SVGColorSlider(
                        onColorSelected: (color) => setState(() => colorCode = color),
                      ),
                    )
                ),
              Text("Choose model: ",
                style: TextStyle(fontWeight: FontWeight.bold, ),),
              Text("Choose year: ",
                style: TextStyle(fontWeight: FontWeight.bold, ),),
              Text("Choose : ",
                style: TextStyle(fontWeight: FontWeight.bold, ),),
              ]),
          )
      );
  }

  Widget modelPaint () {

    if(widget.model == 'car') {
      return PainterCar(
        color: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[0]
            : '#F9CC3D',
        shade: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[1]
            : '#FFF35A',
      );
    } else if (widget.model == 'sport') {
      return PainterSport(
        color: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[0]
            : '#F9CC3D',
        shade: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[1]
            : '#FFF35A',
      );
    } else if(widget.model == 'suv'){
      return PainterSUV(
        color: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[0]
            : '#F9CC3D',
        shade: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[1]
            : '#FFF35A',
      );
    } else if(widget.model == 'truck'){
      return PainterTruck(
        color: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[0]
            : '#F9CC3D',
        shade: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[1]
            : '#FFF35A',
      );
    } else if(widget.model == 'van'){
      return PainterVan(
        color: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[0]
            : '#F9CC3D',
        shade: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[1]
            : '#FFF35A',
      );
    } else {
      return Text('Not Available');
    }
  }
}