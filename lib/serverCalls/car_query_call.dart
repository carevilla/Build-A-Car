
import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:buildacar/appDisplay/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'car.dart';
import 'car_classes.dart';

/// This file contains methods that call the Car Query Api

Future<List<dynamic>> getAPIYears() async{


  List<dynamic> years = [];

  var response = await http.get(Uri.parse('https://www.carqueryapi.com/api/0.3/?callback=?&cmd=getYears'));
  print(response.body.runtimeType);
  
  var responseDecoded = jsonDecode(response.body.substring(2, response.body.length-2));

  var yearsList = responseDecoded['Years'];
  years.add(yearsList['min_year']);
  years.add(yearsList['mas_year']);

  return years;
}


void createList() async {

  List<Car> truckTemp = [];

  var response = await http.get(Uri.parse('https://www.carqueryapi.com/api/0.3/?callback=?&cmd=getTrims&[params]'));
  var responseDecoded = jsonDecode(response.body.substring(2, response.body.length-2));
  var responseTrims = responseDecoded['Trims'];
  print(responseTrims[1]['model_year']);
  var colorList = ['Black',
    'White', 'Grey', 'Red', 'Blue',];

  print(responseTrims[44]);

  for(int i = 0; i < 500; i++){
    if(responseTrims[i]['model_body'].contains('Pickup')){
      var randomColor = Random().nextInt(colorList.length);
      carsListDB.trucksList.add(new Truck(
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
      carsListDB.sportList.add(new Sport(
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
      carsListDB.familyCarList.add(new FamilyCar(
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
      carsListDB.suvList.add(new SUV(
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
      carsListDB.vanList.add(new Van(
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

  /*
  print("TRUCKS: ${trucksList.length}");
  print("SPORT: ${sportList.length}");
  print("SUV: ${suvList.length}");
  print("FAM CAR: ${familyCarList.length}");
  print("VAN: ${vanList.length}");

   */

}

