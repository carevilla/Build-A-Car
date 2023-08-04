
import 'dart:core';
import 'package:buildacar/appDisplay/buildACar/userChoices.dart';
import 'package:buildacar/appDisplay/main.dart';

import '../../serverCalls/car.dart';

/// Contains lists with a certain number of matches
/// of the user choices selected.
class CarMatches {

  List<Car> yearMatch = [];
  List<Car> twomatches = [];
  List<Car> threeMatches = [];
  List<Car> fourMatches = [];
  List<Car> fiveMatches = [];
  List<Car> sixMacthes = [];
  List<Car> sevenMatches = [];

  CarMatches(UserChoices user){
    yearList(user.getCarType, user.getYear);
    forTwoMatches(user.getMake);
    forThreeMatches(user.getModel);
    forMoreMatches(user.getDrive, user.getDoors, user.getFuelType, user.getColor);
  }

  yearList(String carModel, String selectedYear){
    yearMatch = carsListDB.listOfCarsByYear(carModel, selectedYear);
  }

  forTwoMatches(String make){
    for(Car car in yearMatch){
      if(car.getMake == make){
        twomatches.add(car);
      }
    }
  }

  forThreeMatches(String model){
    for(Car car in twomatches){
      if(car.getModel == model){
        threeMatches.add(car);
      }
    }
  }

  forMoreMatches(String drive, String doors, String fuel, String color){

    for(Car car in threeMatches){
      int matchingCount = 3;
      if(car.getDrive == drive){
        matchingCount += 1;
      }
      if(car.getDoors == doors){
        matchingCount += 1;
      }
      if(car.getFuelType == fuel){
        matchingCount += 1;
      }
      if(car.getColor == color){
        matchingCount += 1;
      }

      if(matchingCount == 4){
        fourMatches.add(car);
      } else if(matchingCount == 5){
        fiveMatches.add(car);
      } else if(matchingCount == 6){
        sixMacthes.add(car);
      } else if(matchingCount == 7){
        sevenMatches.add(car);
      }
    }
  }

}