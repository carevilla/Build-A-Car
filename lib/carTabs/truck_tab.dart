import 'package:flutter/material.dart';
import '../utilsTab/car_tile.dart';

class TruckTab extends StatelessWidget {

  // List of cars
  List trucksOnSale = [
    ["Chevrolet" , "Silverado" , '38,960' , Colors.purple , 'lib/Build-A-Car_pictures/Vehicles_BAC/Chevy_Silverado_TRUCK.png'],
    ["Toyota" , "Tacoma" , '33,560' , Colors.blue , 'lib/Build-A-Car_pictures/Vehicles_BAC/Toyota_Tacoma_TRUCK.png'],
    ["Ford" , "F150" , '48,390' , Colors.red , 'lib/Build-A-Car_pictures/Vehicles_BAC/Ford_F150_TRUCK.png'],
    ["Dodge" , "Ram1500" , '67,650' , Colors.green , 'lib/Build-A-Car_pictures/Vehicles_BAC/Dodge_Ram1500_TRUCK.png']
  ];

  @override
  Widget build(BuildContext context){
    return GridView.builder(
        itemCount: trucksOnSale.length,
        padding: const EdgeInsets.all(5.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.3
        ),
        itemBuilder: (context , index) {
          return CarTile(
            carMake: trucksOnSale[index][0],
            carModel: trucksOnSale[index][1],
            carPrice: trucksOnSale[index][2],
            carColor: trucksOnSale[index][3],
            carImage: trucksOnSale[index][4],
          );
        }
    );
  }
}