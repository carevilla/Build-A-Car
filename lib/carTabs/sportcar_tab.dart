import 'package:flutter/material.dart';
import '../utilsTab/car_tile.dart';

class SportTab extends StatelessWidget {

  // List of cars
  List sportOnSale = [
    ["Porsche" , "911" , '120,500' , Colors.purple , 'lib/Build-A-Car_pictures/Vehicles_BAC/Porsche_911_SPORT.png'],
    ["Subaru" , "BRZ" , '42,570' , Colors.blue , 'lib/Build-A-Car_pictures/Vehicles_BAC/Subaru_BRZ_SPORT.png'],
    ["Nissan" , "GTR" , '170,000' , Colors.red , 'lib/Build-A-Car_pictures/Vehicles_BAC/Nissan_GTR_SPORT.png'],
    ["BMW" , "M3" , '128,000' , Colors.green , 'lib/Build-A-Car_pictures/Vehicles_BAC/BMW_M3_SPORT.png']
  ];

  @override
  Widget build(BuildContext context){
    return GridView.builder(
        itemCount: sportOnSale.length,
        padding: const EdgeInsets.all(5.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.3
        ),
        itemBuilder: (context , index) {
          return CarTile(
            carMake: sportOnSale[index][0],
            carModel: sportOnSale[index][1],
            carPrice: sportOnSale[index][2],
            carColor: sportOnSale[index][3],
            carImage: sportOnSale[index][4],
          );
        }
    );
  }
}