

import 'package:buildacar/appDisplay/main.dart';
import 'package:buildacar/serverCalls/car_query_call.dart';
import 'package:buildacar/appDisplay/buildACar/painter.dart';
import 'package:buildacar/appDisplay/buildACar/userChoices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Results.dart';
import 'colors.dart';

/// Class shows the build your own car page to the user.
/// This is where they chose the model, color of the car.


class Build extends StatefulWidget{

  String model ='';
  UserChoices user = UserChoices();

  Build(String m,){                                                              /// receives model chosen by user
    model = m;
  }

  @override
  State<Build> createState() => _Build();
}



class _Build extends State<Build> {

  String colorCode = '';
  String showYearS = DateTime.now().year.toString();
  String yearSelected = "";
  String makeSelected = "";
  String modelSelected = "";
  String doorsSelected = "";
  String driveSelected = "";
  String fuelSelected = "";

  List<String> makesAvailable = [];
  List<String> modelsAvailable = [];
  List<String> doorsAvailable = [];
  List<String> driveAvailable = [];
  List<String> fuelAvailable = [];

  @override
  update(){                                                          /// updates button to show the selected year
    setState(() {
      yearSelected = widget.user.getYear;
      makeSelected = widget.user.getMake;
      modelSelected = widget.user.getModel;
      doorsSelected = widget.user.getDoors;
      driveSelected = widget.user.getDrive;
      fuelSelected = widget.user.getFuelType;

      widget.user.setColor = colorCode;
      makesAvailable = carsListDB.showMake(widget.model, yearSelected);
      modelsAvailable = carsListDB.showModels(widget.model, yearSelected, makeSelected);
      doorsAvailable = carsListDB.showDoors(widget.model, yearSelected, makeSelected, modelSelected);
      driveAvailable = carsListDB.showDrive(widget.model, yearSelected, makeSelected, modelSelected);
      fuelAvailable = carsListDB.showFuelType(widget.model, yearSelected, makeSelected, modelSelected);
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.user.setCarType = widget.model;
    final DateTime selectedDate = widget.user.getDate;
    update();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Build Your Own Car"),
        backgroundColor: Colors.lightBlue,
      ),
      body: SafeArea(
        right: false,
          child: ListView(                                                      /// creates the page scrollable
            padding: const EdgeInsets.all(15),
            children: [
              Container(                                                      /// shows svg of chosen model
                  height: 130,
                  width: 150,
                  child: modelPaint()
                ),
              const Text("Choose your color: ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
              Container(                                                               /// shows colors that the user can select
                    child: SizedBox(
                      height: 80,
                      child: SVGColorSlider(
                        onColorSelected: (color) => setState(() => colorCode = color),
                      ),
                    )
              ),
              const Divider(height: 5, color: Colors.grey,),
              Center(
                child: Row(                                                                       /// row shows text and button to pick year wanted
                  children: [
                    const Text("Year:    ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                    dropDown(carsListDB.showAvailableYears(widget.model), "year"),
                    SizedBox(width: 50,),
                    Text(yearSelected, overflow: TextOverflow.fade,)
                  ],
                ),
              ),
              const Divider(height: 5, color: Colors.grey,),
              Row(                                                              /// Row chose text and button to choose model
                children: [
                  const Text("Make:   ",
                    style: TextStyle(fontWeight: FontWeight.bold, ),),
                  dropDown(makesAvailable, "make"),
                  SizedBox(width: 50,),
                  Text(makeSelected)
                ],
              ),
              const Divider(height: 5, color: Colors.grey,),
              Row(
                children: [
                  const Text("Model:  ",
                    style: TextStyle(fontWeight: FontWeight.bold, ),),
                  dropDown(modelsAvailable, "model"),
                  SizedBox(width: 50,),
                  Text(modelSelected)
                ],
              ),
              const Divider(height: 5, color: Colors.grey,),
              Row(
                children: [
                  const Text("Doors:   ",
                    style: TextStyle(fontWeight: FontWeight.bold, ),),
                  dropDown(doorsAvailable, "doors"),
                  SizedBox(width: 50,),
                  Text(doorsSelected)
                ],
              ),
              const Divider(height: 5, color: Colors.grey,),
              Row(
                children: [
                  const Text("Drive:    ",
                    style: TextStyle(fontWeight: FontWeight.bold, ),),
                  dropDown(driveAvailable, "drive"),
                  SizedBox(width: 50,),
                  Text(driveSelected)
                ],
              ),
              const Divider(height: 5, color: Colors.grey,),
              Row(
                children: [
                  const Text("Fuel-Type:  ",
                    style: TextStyle(fontWeight: FontWeight.bold, ),),
                  dropDown(fuelAvailable, "fuel"),
                  SizedBox(width: 50,),
                  Text(fuelSelected)
                ],
              ),
              const Divider(height: 5, color: Colors.grey,),
              const Divider(height: 20, color: Colors.white,),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Results(widget.user)));
                  },
                  child: Text('Show Results'),
                ),
              )

            ]),
          )
      );
  }

  @override
  Widget dropDown(List<String> list, String selectingOption) {
    list.add("Select Option...");
    String dropdownValue = list.last;


    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.lightBlue),
      underline: Container(
        height: 2,
        color: Colors.indigo,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
          if(selectingOption == "year"){
            widget.user.setYear = value!;
          } else if (selectingOption == "make"){
            widget.user.setMake = value!;
          } else if (selectingOption == "model"){
            widget.user.setModel = value!;
          } else if (selectingOption == "doors"){
            widget.user.setDoors = value!;
          } else if (selectingOption == "drive"){
            widget.user.setDrive = value!;
          } else if (selectingOption == "fuel"){
            widget.user.setFuelType = value!;
          }

          update();
        });

      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  void pickYear(UserChoices user, DateTime selectedDate,) {                        /// source https://stackoverflow.com/questions/62022135/how-to-only-display-the-year-in-datepicker-for-flutter

                                                                                 /// We used the source above to learn how to only select year and make the year scrollable.
    showDialog(                                                                 /// Some changes where made such as size, the years provided, and we added the code to update user's selection
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Year"),
          content: Container( // Need to use container to add size constraint.
            width: 200,
            height: 200,
            child: YearPicker(                                                  /// This creates a lis of years starting from 2023 (Now) to 100 years back
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year, 1),
              initialDate: DateTime.now(),
              selectedDate: selectedDate,
              onChanged: (DateTime dateTime) {
                // close the dialog when year is selected.
                user.setYear = dateTime.year.toString();                                   /// user choices are saved into the user class
                user.setDate = dateTime;
                Navigator.pop(context);                                         /// Alert Dialog is removed
              },
            ),
          ),
        );
      },
    );
  }

  Widget modelPaint () {                                                        /// Method checks what model of car the user selected and shows the correct svg widget.

    if(widget.model == 'familyCar') {                                                 /// shows car svg
      return PainterCar(
        color: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[0]
            : '#F9CC3D',
        shade: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[1]
            : '#FFF35A',
      );
    } else if (widget.model == 'sport') {                                       /// shows sport car svg
      return PainterSport(
        color: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[0]
            : '#F9CC3D',
        shade: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[1]
            : '#FFF35A',
      );
    } else if(widget.model == 'suv'){                                           /// shows suv svg
      return PainterSUV(
        color: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[0]
            : '#F9CC3D',
        shade: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[1]
            : '#FFF35A',
      );
    } else if(widget.model == 'truck'){                                         /// shows truck svg
      return PainterTruck(
        color: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[0]
            : '#F9CC3D',
        shade: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[1]
            : '#FFF35A',
      );
    } else if(widget.model == 'van'){                                           /// shows van svg
      return PainterVan(
        color: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[0]
            : '#F9CC3D',
        shade: colorCode.isNotEmpty
            ? colorCode.split('.')[1].split(':')[1]
            : '#FFF35A',
      );
    } else {
      return Text('Not Available');                                             /// shows error message
    }
  }
}