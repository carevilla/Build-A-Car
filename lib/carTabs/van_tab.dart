import 'package:flutter/material.dart';
import '../utilsTab/car_tile.dart';

class VanTab extends StatelessWidget {

  // List of cars
  List vansOnSale = [
    ["Kia" , "Sedona" , '23,670' , Colors.purple , 'lib/Build-A-Car_pictures/Vehicles_BAC/Kia_Sedona_VAN.png'],
    ["Mercedes" , "Sprinter" , '39,970' , Colors.blue , 'lib/Build-A-Car_pictures/Vehicles_BAC/Mercedes-Benz_Sprinter_VAN.png'],
    ["Nissan" , "Quest" , '34,500' , Colors.red , 'lib/Build-A-Car_pictures/Vehicles_BAC/Nissan_Quest_VAN.png'],
    ["GMC" , "Savana" , '45,310' , Colors.green , 'lib/Build-A-Car_pictures/Vehicles_BAC/GMC_Savana_VAN.png']
  ];

  @override
  Widget build(BuildContext context){
    return GridView.builder(
        itemCount: vansOnSale.length,
        padding: const EdgeInsets.all(5.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.3
        ),
        itemBuilder: (context , index) {
          return CarTile(
            carMake: vansOnSale[index][0],
            carModel: vansOnSale[index][1],
            carPrice: vansOnSale[index][2],
            carColor: vansOnSale[index][3],
            carImage: vansOnSale[index][4],
          );
        }
    );
  }
}