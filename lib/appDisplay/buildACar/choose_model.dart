
import 'package:buildacar/appDisplay/buildACar/build.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Class takes care of displaying a page to the user where they can select a car model
/// they would like to build.
class ChooseModel extends StatefulWidget {
  const ChooseModel({super.key});

  @override
  State<ChooseModel> createState() => _ChooseModel();
}

class _ChooseModel extends State<ChooseModel> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Model'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Stack(
          children: [
            GridView.count(                               /// Uses a grid to show the models on the page
              primary: false,
              crossAxisCount: 2,
              children: <Widget> [
                Column(                                   /// contains image and text for 'Family Car'
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Build('car')));
                        },
                        icon: Image.asset('lib/Build-A-Car_pictures/TabCar.png', semanticLabel: 'Family Car',),
                      ),
                    ),
                    Text("Family Car", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  ],
                ),
                Column(                                               /// contains image and text for 'Sports Car'
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Build('sport')));
                        },
                        icon: Image.asset('lib/Build-A-Car_pictures/TabSport.png',),
                      ),
                    ),
                    Text("Sports Car", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  ],
                ),
                Column(                                                 /// contains image and text for 'SUV'
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Build('suv')));
                        },
                        icon: Image.asset('lib/Build-A-Car_pictures/TabSUV.png',),
                      ),
                    ),
                    Text("SUV", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  ],
                ),
                Column(                                                 /// contains image and text for 'Truck'
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Build('truck')));
                        },
                        icon: Image.asset('lib/Build-A-Car_pictures/TabTruck.png',),
                      ),
                    ),
                    Text("Truck", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  ],
                ),
                Column(                                                   /// contains image and text for 'Van'
                  children: [
                    Container(
                      height: 140,
                      width: 140,
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Build('van')));
                        },
                        icon: Image.asset('lib/Build-A-Car_pictures/TabVan.png',),
                      ),
                    ),
                    Text("Van", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                  ],
                ),
            ],
          ),
        ]
      )
    )

    );
  }

}