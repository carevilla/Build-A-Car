///@author Leila Martinez
///@author Christian Revilla

import 'package:buildacar/appDisplay/buildACar/build.dart';
import 'package:flutter/material.dart';

/**
 * Class takes care of displaying a page to the user where they can select a car model
 * they would like to build.
 */
class ChooseModel extends StatefulWidget {
  const ChooseModel({super.key});

  @override
  State<ChooseModel> createState() => _ChooseModel();
}

class _ChooseModel extends State<ChooseModel> {

  /**
   * Returns the widgets for Choose Model, this page is the
   * @param BuildContext
   * @return Widget - Contains all the widgets presenting on the screen to the user. Icon buttons presenting each model they can build.
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Model'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Stack(
        children: [
          GridView.count(
            primary: false,
            crossAxisCount: 2,
            children: <Widget> [
              Column(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    margin: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                      color: Colors.cyan,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Build('familyCar')));
                      },
                      icon: Image.asset('lib/Build-A-Car_pictures/TabCar.png', semanticLabel: 'Family Car',),
                    ),
                  ),
                  const Text("Family Car", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    margin: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
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
                  const Text("Sports Car",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    margin: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
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
                  const Text("SUV",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    margin: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
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
                  const Text("Truck",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    margin: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
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
                  const Text("Van",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ],
              ),
          ],
        ),
      ]
      )
    );
  }

}