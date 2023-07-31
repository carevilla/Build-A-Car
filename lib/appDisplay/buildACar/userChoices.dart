


/// Class will save user's selected options
/// that the system will look up in the API

class UserChoices {

  String _carColor = "";
  String _year = DateTime.now().year.toString();
  DateTime _dateTime = DateTime.now();
  String _carMake = "Make...";
  String _carModel = "Model...";
  String _carDoors = "";
  String _carDrive = "Drive...";
  String _carFuelType = "Fuel Type...";

  /// Getters and Setters

  String get getColor => _carColor;
  set setColor(String c){
    _carColor = c;
  }

  String get getYear => _year;
  set setYear(String y){
    _year = y;
  }

  DateTime get getDate => _dateTime;
  set setDate(DateTime d){
    _dateTime = d;
  }

  String get getMake => _carMake;
  set setMake(String m) {
    _carMake = m;
  }

  String get getModel => _carModel;
  set setModel(String m){
    _carModel = m;
  }

  String get getDoors => _carDoors;
  set setDoors(String d){
    _carDoors = d;
  }

  String get getDrive => _carDrive;
  set setDrive(String d){
    _carDrive = d;
  }

  String get getFuelType => _carFuelType;
  set setFuelType(String f) {
    _carFuelType = f;
  }


}