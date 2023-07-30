

import 'package:mobx/mobx.dart';
import 'car.dart';

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
  List<Car> showResults(String carModel, String color, String make, String model, String fuelType, String drive, int doors, int year){

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



