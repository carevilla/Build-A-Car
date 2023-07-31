

import 'package:buildacar/appDisplay/main.dart';
import 'package:mobx/mobx.dart';
import '../serverCalls/car.dart';

part 'cars_saveddata.g.dart';

class CarListDB = CarsListDataBase with _$CarListDB;

abstract class CarsListDataBase with Store {

  @observable
  List<Car> trucksList = <Car>[];
  List<Car> sportList = <Car>[];
  List<Car> suvList = <Car>[];
  List<Car> vanList = <Car>[];
  List<Car> familyCarList = <Car>[];


  @action
  List<String> showAvailableYears(String carModel){

    Set<String> tempYears = {};

    if(carModel == "familyCar"){
      for(Car familyCar in familyCarList){
        print(familyCar.getYear);
        tempYears.add(familyCar.getYear);
      }
    } else if (carModel == "truck") {
      for(Car truck in trucksList){
        tempYears.add(truck.getYear);
      }
    } else if (carModel == "suv") {
      for(Car suv in suvList){
        tempYears.add(suv.getYear);
      }
    } else if (carModel == "van") {
      for(Car van in vanList){
        tempYears.add(van.getYear);
      }
    } else if (carModel == "sport") {
      for(Car sport in sportList){
        tempYears.add(sport.getYear);
      }
    }

    return tempYears.toList();

  }

  @action
  List<String> showMake(String carModel, String yearSelected){

    Set<String> temp = {};

    if(carModel == "familyCar"){
      for(Car familyCar in familyCarList){
        temp.add(familyCar.getMake);
      }
    } else if (carModel == "truck") {
      for(Car truck in trucksList){
        temp.add(truck.getMake);
      }
    } else if (carModel == "suv") {
      for(Car suv in suvList){
        temp.add(suv.getMake);
      }
    } else if (carModel == "van") {
      for(Car van in vanList){
        temp.add(van.getMake);
      }
    } else if (carModel == "sport") {
      for(Car sport in sportList){
        temp.add(sport.getMake);
      }
    }


    return temp.toList();

  }

  @action
  List<String> showModels(String carModel){

    Set<String> temp = {};

    if(carModel == "familyCar"){
      for(Car familyCar in familyCarList){
        temp.add(familyCar.getModel);
      }
    } else if (carModel == "truck") {
      for(Car truck in trucksList){
        temp.add(truck.getModel);
      }
    } else if (carModel == "suv") {
      for(Car suv in suvList){
        temp.add(suv.getModel);
      }
    } else if (carModel == "van") {
      for(Car van in vanList){
        temp.add(van.getModel);
      }
    } else if (carModel == "sport") {
      for(Car sport in sportList){
        temp.add(sport.getModel);
      }
    }

    return temp.toList();

  }

  @action
  List<Car> showResults(String carModel, String color, String make, String model, String fuelType, String drive, String doors, String year){

    List<Car> results = [];

    if(carModel == "familyCar") {
      for(int i = 0; i < familyCarList.length; i++){
        if(familyCarList[i].getColor==color && familyCarList[i].getMake==make && familyCarList[i].getModel==model
        && familyCarList[i].getFuelType==fuelType && familyCarList[i].getDrive==drive && familyCarList[i].getDoors==doors
        && familyCarList[i].getYear==year){
          results.add(familyCarList[i]);
        }
      }
    } else if(carModel == "truck") {
      for(int i = 0; i < trucksList.length; i++){
        if(trucksList[i].getColor==color && trucksList[i].getMake==make && trucksList[i].getModel==model
            && trucksList[i].getFuelType==fuelType && trucksList[i].getDrive==drive && trucksList[i].getDoors==doors
            && trucksList[i].getYear==year){
          results.add(trucksList[i]);
        }
      }
    } else if(carModel == "suv"){
      for(int i = 0; i < suvList.length; i++){
        if(suvList[i].getColor==color && suvList[i].getMake==make && suvList[i].getModel==model
            && suvList[i].getFuelType==fuelType && suvList[i].getDrive==drive && suvList[i].getDoors==doors
            && suvList[i].getYear==year){
          results.add(suvList[i]);
        }
      }
    } else if(carModel == "van"){
      for(int i = 0; i < vanList.length; i++){
        if(vanList[i].getColor==color && vanList[i].getMake==make && vanList[i].getModel==model
            && vanList[i].getFuelType==fuelType && vanList[i].getDrive==drive && vanList[i].getDoors==doors
            && vanList[i].getYear==year){
          results.add(vanList[i]);
        }
      }
    } else if (carModel == "sport") {
      for(int i = 0; i < sportList.length; i++){
        if(sportList[i].getColor==color && sportList[i].getMake==make && sportList[i].getModel==model
            && sportList[i].getFuelType==fuelType && sportList[i].getDrive==drive && sportList[i].getDoors==doors
            && sportList[i].getYear==year){
          results.add(sportList[i]);
        }
      }
    }

    return results;

  }

  /*
  @action
  Car showRandom(String carModel) {

    Random rand = new Random();

    if(carModel == "truck"){
      int index = rand.nextInt(trucksList.length);
      return trucksList[index];
    } else if (carModel == "suv"){
      int index = rand.nextInt(suvList.length);
      return suvList[index];
    } else if (carModel == "sport"){
      int index = rand.nextInt(sportList.length);
      return sportList[index];
    } else if (carModel == "van") {
      int index = rand.nextInt(vanList.length);
      return vanList[index];
    } else (carModel == "familyCar") {
      int index = rand.nextInt(familyCarList.length);
      return familyCarList[index];
    }

  }

   */


}



