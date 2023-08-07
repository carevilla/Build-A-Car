/// @author Christian Revilla
/// @author Leila Martinez

import 'package:flutter/material.dart';
import '../utilsTab/car_tile.dart';

/// Class showing the cars on the home page
class CarTab extends StatelessWidget {

  // List of cars for demonstration
  List carsOnSale = [
    ["Chevrolet" , "Cobalt" , '21,320' , Colors.purple , 'lib/Build-A-Car_pictures/Vehicles_BAC/Chevy_Cobalt_CAR.png'],
    ["Toyota" , "Corrola" , '26,120' , Colors.blue , 'lib/Build-A-Car_pictures/Vehicles_BAC/Toyota_Corrola_CAR.png'],
    ["Volkswagen" , "Jetta" , '30,430' , Colors.red , 'lib/Build-A-Car_pictures/Vehicles_BAC/Volkswagen_Jetta_CAR.png'],
    ["Ford" , "Taurus" , '33,760' , Colors.green , 'lib/Build-A-Car_pictures/Vehicles_BAC/Ford_taurus_CAR.png']
  ];

  /** Build Function to build 4 sections using GridView
   *  Each section has an image, make, model, and price associated with them
   *  As each index is passed a CarTile is created with each attribute
   *  @return Widget Representing the 4 cars on the homepage
   *  @param BuildContext context
   */
  @override
  Widget build(BuildContext context){
    return GridView.builder(
        itemCount: carsOnSale.length,
        padding: const EdgeInsets.all(5.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.3
        ),
        itemBuilder: (context , index) {
          return CarTile(
            carMake: carsOnSale[index][0],
            carModel: carsOnSale[index][1],
            carPrice: carsOnSale[index][2],
            carColor: carsOnSale[index][3],
            carImage: carsOnSale[index][4],
          );
        }
    );
  }
}