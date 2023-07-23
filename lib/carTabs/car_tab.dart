import 'package:flutter/material.dart';

import '../utilsTab/car_tile.dart';

class CarTab extends StatelessWidget {

  // List of cars
  List carsOnSale = [
    ["Chevrolet" , "Cobalt" , '30000' , Colors.purple , 'lib/Build-A-Car_pictures/Vehicles_BAC/Chevy_Cobalt_CAR.png'],
    ["Toyota" , "Corrola" , '30000' , Colors.blue , 'lib/Build-A-Car_pictures/Vehicles_BAC/Toyota_Corrola_CAR.png'],
    ["Volkswagen" , "Jetta" , '30000' , Colors.red , 'lib/Build-A-Car_pictures/Vehicles_BAC/Volkswagen_Jetta_CAR.png'],
    ["Ford" , "Taurus" , '30000' , Colors.green , 'lib/Build-A-Car_pictures/Vehicles_BAC/Ford_taurus_CAR.png']
  ];

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