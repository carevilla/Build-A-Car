

import 'package:buildacar/serverCalls/car_query_call.dart';
import 'package:buildacar/serverCalls/erase.dart';
import 'package:buildacar/appDisplay/buildACar/painter.dart';
import 'package:buildacar/appDisplay/buildACar/search_results.dart';
import 'package:buildacar/appDisplay/buildACar/userChoices.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

/// Class shows the build your own car page to the user.
/// This is where they chose the model, color of the car.


class Build extends StatefulWidget{

  String model ='';
  User user = User();                                                           /// a user class is created

  Build(String m){                                                              /// receives model chosen by user
    model = m;
  }

  @override
  State<Build> createState() => _Build();
}



class _Build extends State<Build> {


  String colorCode = '';
  int showYearS = DateTime.now().year;

  @override
  selectedYear(int y){                                                          /// updates button to show the selected year
    setState(() {
      showYearS = y;
    });
  }

  @override
  Widget build(BuildContext context) {

    final DateTime selectedDate = widget.user.getDate;
    selectedYear(widget.user.getYear);
    randomPrint();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Build Your Own Car"),
        backgroundColor: Colors.lightBlue,
      ),
      body: SafeArea(
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
              Row(                                                                       /// row shows text and button to pick year wanted
                children: [
                  const Text("Choose year: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                      onPressed: () {

                        pickYear(widget.user, selectedDate);
                      },
                      child: Row(
                        children: [
                          Text('${showYearS}'),
                          Icon(Icons.arrow_drop_down),
                        ],
                      )
                  ),
                ],
              ),
              const Divider(height: 5, color: Colors.grey,),
              Row(                                                              /// Row chose text and button to choose model
                children: [
                  const Text("Choose Make: ",
                    style: TextStyle(fontWeight: FontWeight.bold, ),),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                      onPressed: (){
                        pickYear(widget.user, selectedDate);
                      },
                      child: Row(
                        children: [
                          Text('${widget.user.getMake}'),
                          Icon(Icons.arrow_drop_down),
                        ],
                      )),

                ],
              ),
              const Divider(height: 5, color: Colors.grey,),
              Row(
                children: [
                  const Text("Choose Model: ",
                    style: TextStyle(fontWeight: FontWeight.bold, ),),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                      onPressed: (){
                        pickYear(widget.user, selectedDate);
                      },
                      child: Row(
                        children: [
                          Text('${widget.user.getModel}'),
                          Icon(Icons.arrow_drop_down),
                        ],
                      )),
                ],
              ),
              const Divider(height: 5, color: Colors.grey,),
              Row(
                children: [
                  const Text("Choose number of Doors: ",
                    style: TextStyle(fontWeight: FontWeight.bold, ),),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                      onPressed: (){
                        pickYear(widget.user, selectedDate);
                      },
                      child: Row(
                        children: [
                          Text('${widget.user.getDoors}'),
                          Icon(Icons.arrow_drop_down),
                        ],
                      )),
                ],
              ),
              const Divider(height: 5, color: Colors.grey,),
              Row(
                children: [
                  const Text("Choose Drive: ",
                    style: TextStyle(fontWeight: FontWeight.bold, ),),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                      onPressed: (){
                        pickYear(widget.user, selectedDate);
                      },
                      child: Row(
                        children: [
                          Text('${widget.user.getDrive}'),
                          Icon(Icons.arrow_drop_down),
                        ],
                      )),
                ],
              ),
              const Divider(height: 5, color: Colors.grey,),
              Row(
                children: [
                  const Text("Choose Fuel Type: ",
                    style: TextStyle(fontWeight: FontWeight.bold, ),),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                      onPressed: (){
                        pickYear(widget.user, selectedDate);
                      },
                      child: Row(
                        children: [
                          Text('${widget.user.getFuelType}'),
                          Icon(Icons.arrow_drop_down),
                        ],
                      )),
                ],
              ),
              const Divider(height: 5, color: Colors.grey,),
              const Divider(height: 20, color: Colors.white,),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ResultsPage()));
                  },
                  child: Text('Show Results'),
                ),
              )

            ]),
          )
      );
  }


  void pickYear(User user, DateTime selectedDate,) {                        /// source https://stackoverflow.com/questions/62022135/how-to-only-display-the-year-in-datepicker-for-flutter

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
                user.setYear = dateTime.year;                                   /// user choices are saved into the user class
                user.setDate = dateTime;
                selectedYear(widget.user.getYear);
                Navigator.pop(context);                                         /// Alert Dialog is removed
              },
            ),
          ),
        );
      },
    );
  }

  Widget modelPaint () {                                                        /// Method checks what model of car the user selected and shows the correct svg widget.

    if(widget.model == 'car') {                                                 /// shows car svg
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