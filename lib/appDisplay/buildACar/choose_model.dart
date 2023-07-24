
import 'package:buildacar/appDisplay/buildACar/vect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            GridView.count(
              primary: false,
              crossAxisCount: 2,
              children: <Widget> [
                Container(
                  height: 15,
                  width: 15,
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Build()));
                    },
                    icon: Image.asset('lib/Build-A-Car_pictures/TabCar.png', semanticLabel: 'Family Car',),
                  ),
                ),
                Container(
                  height: 15,
                  width: 15,
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Build()));
                    },
                    icon: Image.asset('lib/Build-A-Car_pictures/TabSport.png',),
                  ),
                ),
                Container(
                  height: 15,
                  width: 15,
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Build()));
                    },
                    icon: Image.asset('lib/Build-A-Car_pictures/TabSUV.png',),
                  ),
                ),
                Container(
                  height: 15,
                  width: 15,
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Build()));
                    },
                    icon: Image.asset('lib/Build-A-Car_pictures/TabTruck.png',),
                  ),
                ),
                Container(
                  height: 15,
                  width: 15,
                  margin: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Build()));
                    },
                    icon: Image.asset('lib/Build-A-Car_pictures/TabVan.png',),
                  ),
                ),
            ],
          ),
        ]
      )
    )

    );
  }

}