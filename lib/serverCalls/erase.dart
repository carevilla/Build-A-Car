

import 'package:buildacar/appDisplay/main.dart';
import 'package:flutter/cupertino.dart';

import 'car_query_call.dart';



randomPrint() async{

  List<dynamic> years = await getAPIYears();
  debugPrint('MIN: ${years[0]}');
  debugPrint('Max: ${years[1]}');


  createList();

}