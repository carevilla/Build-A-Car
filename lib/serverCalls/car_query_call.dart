/// @author Christian Revilla
/// @author Leila Martinez
/// This file contains methods that call the Car Query Api

import 'dart:convert';
import 'dart:math';
import 'package:buildacar/appDisplay/main.dart';
import 'package:http/http.dart' as http;
import 'car_classes.dart';


/** Function to get all the years of vehicles in the API database
 * Current free version only has year 2022 vehciles
 * @return Future<List<dynamic>> representing all the years in the API
 */
Future<List<dynamic>> getAPIYears() async{
  List<dynamic> years = [];

  var response = await http.get(Uri.parse('https://www.carqueryapi.com/api/0.3/?callback=?&cmd=getYears'));
  var responseDecoded = jsonDecode(response.body.substring(2, response.body.length-2));
  var yearsList = responseDecoded['Years'];
  years.add(yearsList['min_year']);
  years.add(yearsList['mas_year']);

  return years;
}

/** Main function to parse all data in API
 * Depending on model of vehicle specific class is created
 * Vehicle is built with attributes defined in Car super class
 * The List is passed through app via MOBX and being observable data
 * @return void
 */
void createList() async {
  var response = await http.get(Uri.parse('https://www.carqueryapi.com/api/0.3/?callback=?&cmd=getTrims&[params]'));
  var responseDecoded = jsonDecode(response.body.substring(2, response.body.length-2));
  var responseTrims = responseDecoded['Trims'];
  var colorList = ['Black', 'White', 'Grey', 'Red', 'Blue',];

  for(int i = 0; i < 500; i++){
    if(responseTrims[i]['model_body'].contains('Pickup')){
      var randomColor = Random().nextInt(colorList.length);
      carsListDB.trucksList.add(Truck(
        colorList[randomColor],
          responseTrims[i]['model_body'],
          responseTrims[i]['model_name'],
          responseTrims[i]['model_make_id'],
          (responseTrims[i]['model_doors'] ?? "0") ,
          (responseTrims[i]['model_year'] ?? "0"),
          responseTrims[i]['model_transmission_type'],
          responseTrims[i]['model_engine_fuel']
      ));
    } else if(responseTrims[i]['model_trim'].contains('Coupe')) {
      var randomColor = Random().nextInt(colorList.length);
      carsListDB.sportList.add(Sport(
          colorList[randomColor],
          responseTrims[i]['model_body'],
          responseTrims[i]['model_name'],
          responseTrims[i]['model_make_id'],
          (responseTrims[i]['model_doors'] ?? "0") ,
          (responseTrims[i]['model_year'] ?? "0"),
          responseTrims[i]['model_transmission_type'],
          responseTrims[i]['model_engine_fuel']
      ));
    } else if(responseTrims[i]['model_body'].contains('Compact')) {
      var randomColor = Random().nextInt(colorList.length);
      carsListDB.familyCarList.add(FamilyCar(
          colorList[randomColor],
          responseTrims[i]['model_body'],
          responseTrims[i]['model_name'],
          responseTrims[i]['model_make_id'],
          (responseTrims[i]['model_doors'] ?? "0") ,
          (responseTrims[i]['model_year'] ?? "0"),
          responseTrims[i]['model_transmission_type'],
          responseTrims[i]['model_engine_fuel']
      ));
    } else if(responseTrims[i]['model_trim'].contains('SUV')) {
      var randomColor = Random().nextInt(colorList.length);
      carsListDB.suvList.add(SUV(
          colorList[randomColor],
          responseTrims[i]['model_body'],
          responseTrims[i]['model_name'],
          responseTrims[i]['model_make_id'],
          (responseTrims[i]['model_doors'] ?? "0") ,
          (responseTrims[i]['model_year'] ?? "0"),
          responseTrims[i]['model_transmission_type'],
          responseTrims[i]['model_engine_fuel']
      ));
    } else if(responseTrims[i]['model_trim'].contains('Minivan')) {
      var randomColor = Random().nextInt(colorList.length);
      carsListDB.vanList.add(Van(
          colorList[randomColor],
          responseTrims[i]['model_body'],
          responseTrims[i]['model_name'],
          responseTrims[i]['model_make_id'],
          (responseTrims[i]['model_doors'] ?? "0") ,
          (responseTrims[i]['model_year'] ?? "0"),
          responseTrims[i]['model_transmission_type'],
          responseTrims[i]['model_engine_fuel']
      ));
    }
  }
}

