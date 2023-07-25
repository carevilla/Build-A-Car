

import 'package:buildacar/appDisplay/buildACar/painter.dart';
import 'package:buildacar/appDisplay/buildACar/userChoices.dart';
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
  int showYearS = 0000;

  @override
  selectedYear(int y){
    setState(() {
      showYearS = y;
    });
  }

  @override
  Widget build(BuildContext context) {

    User user = User();
    DateTime selectedDate;

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
              Row(
                children: [
                  Text("Choose model: ",
                    style: TextStyle(fontWeight: FontWeight.bold, ),),
                  ElevatedButton(
                      onPressed: (){
                        pickYear(user);
                        selectedYear(user.getYear);
                        print("YEAR: ${user.getYear}");
                      }, child: Text('$showYearS')),
                ],
              ),
              Text("Choose year: ",
                style: TextStyle(fontWeight: FontWeight.bold, ),),
              Text("Choose : ",
                style: TextStyle(fontWeight: FontWeight.bold, ),),
              ]),
          )
      );
  }


  void pickYear(User user){

    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Year"),
          content: Container( // Need to use container to add size constraint.
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year + 100, 1),
              initialDate: DateTime.now(),
              // save the selected date to _selectedDate DateTime variable.
              // It's used to set the previous selected date when
              // re-showing the dialog.
              selectedDate: selectedDate,
              onChanged: (DateTime dateTime) {
                // close the dialog when year is selected.
                user.setYear = dateTime.year;
                Navigator.pop(context);

                // Do something with the dateTime selected.
                // Remember that you need to use dateTime.year to get the year
              },
            ),
          ),
        );
      },
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