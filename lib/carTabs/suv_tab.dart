/// @author Christian Revilla
/// @author Leila Martinez

import 'package:flutter/material.dart';
import '../utilsTab/car_tile.dart';

/// Class showing the SUVs on the home page
class SUVTab extends StatelessWidget {

  // List of SUVs for demonstration
  List suvOnSale = [
    ["JEEP" , "Compass" , '31,240' , Colors.purple , 'lib/Build-A-Car_pictures/Vehicles_BAC/Jeep_Compass_SUV.png'],
    ["Volvo" , "XC60" , '61,650' , Colors.blue , 'lib/Build-A-Car_pictures/Vehicles_BAC/Volvo_XC60_SUV.png'],
    ["Hyundai" , "Tucson" , '42,920' , Colors.red , 'lib/Build-A-Car_pictures/Vehicles_BAC/Hyundai_Tucson_SUV.png'],
    ["Ford" , "Escape" , '29,250' , Colors.green , 'lib/Build-A-Car_pictures/Vehicles_BAC/Ford_Escape_SUV.png']
  ];

  /** Build Function to build 4 sections using GridView
   *  Each section has an image, make, model, and price associated with them
   *  As each index is passed a CarTile is created with each attribute
   *  @return Widget Representing the 4 SUV on the homepage
   *  @param BuildContext context
   */
  @override
  Widget build(BuildContext context){
    return GridView.builder(
        itemCount: suvOnSale.length,
        padding: const EdgeInsets.all(5.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.3
        ),
        itemBuilder: (context , index) {
          return CarTile(
            carMake: suvOnSale[index][0],
            carModel: suvOnSale[index][1],
            carPrice: suvOnSale[index][2],
            carColor: suvOnSale[index][3],
            carImage: suvOnSale[index][4],
          );
        }
    );
  }
}