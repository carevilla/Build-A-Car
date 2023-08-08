/// @author Leila Martinez
/// @author Christian Revilla


import 'package:buildacar/appDisplay/main.dart';
import 'package:buildacar/appDisplay/buildACar/painter.dart';
import 'package:buildacar/appDisplay/buildACar/userChoices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Results.dart';
import 'colors.dart';


/**
 * Class shows the build your own car page to the user.
 * This is where they chose the model, color of the car.
 */
class Build extends StatefulWidget{

  String model ='';
  UserChoices user = UserChoices();

  Build(String m,){
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

  /**
   * Sets current state of list and text values.
   * @return void
   */
  @override
  update(){
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


  /**
   * This shows Build Your Own Car Page with car svg, changing colors, and car questions.
   * @param context
   * @return Widget - Widget respreseting the Build Your Own car Page
   */
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
        minimum: const EdgeInsets.all(10),
          maintainBottomViewPadding: false,
          child: ListView(
            children: [

              Column(
              children: [
                Container(
                    height: 130,
                    width: 400,
                    child: modelPaint()
                  ),
                const Text("Choose your color: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                Container(
                      child: SizedBox(
                        height: 80,
                        child: SVGColorSlider(
                          onColorSelected: (color) => setState(() => colorCode = color),
                        ),
                      )
                ),
                const Divider(height: 5, color: Colors.grey,),
                Center(
                  child: Row(
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
                Row(
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
                      style: TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                    softWrap: false,
                    ),
                    dropDown(fuelAvailable, "fuel"),
                  ],
                ),
                SizedBox(height: 10,),
                Text(fuelSelected, overflow: TextOverflow.ellipsis, softWrap: false,),
                const Divider(height: 5, color: Colors.grey,),
                const Divider(height: 10, color: Colors.white,),
                Center(
                  child: Container(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                      onPressed: () {

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Results(widget.user)));
                      },
                      child: Text('Show Results'),
                    ),
                  ),
                )
              ]),
           ]
          ),
          )
        );
  }

  /**
   * Shows dropdown widget with the list of options from the API database
   * @param List<String> - represents the list of models, makes, number of doors, etc
   * @param String - reprents what questions/option the user is selecting for to set state to text.
   * @return Widget - dropdown menu
   */
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
          child: Text(value, overflow: TextOverflow.ellipsis,),
        );
      }).toList(),
    );
  }

  /**
   * Calls Paint Class depending on what model the user choose. Paint class shows svg.
   * @return Widget - returns svg picture of the model the user selected.
   */
  Widget modelPaint () {

    if(widget.model == 'familyCar') {
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
/*<<<<<<< HEAD
      return const Text('Not Available');                                             /// shows error message
=======*/
      return const Text('Not Available');
//>>>>>>> 9b020bc9956fdb27f4747ff9bc4c53ad80d474c1
    }
  }
}