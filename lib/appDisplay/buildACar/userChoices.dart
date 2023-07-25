

/*
Class will save user's selected options
 */

class User {

  String carColor = "";
  String originCountry = "";
  int _year =0000;
  DateTime _dateTime = DateTime.now();

  int get getYear => _year;
  set setYear(int y){
    _year = y;
  }

  DateTime get getDate => _dateTime;
  set setDate(DateTime d){
    _dateTime = d;
  }


}