


/// Class will save user's selected options
/// that the system will look up in the API

class User {

  String _carColor = "";
  int _year = DateTime.now().year;
  DateTime _dateTime = DateTime.now();
  String _carMake = "Make...";
  String _carModel = "Model...";
  int _carDoors = 0;
  String _carDrive = "Drive...";
  String _carFuelType = "Fuel Type...";

  /// Getters and Setters

  String get getColor => _carColor;
  set setColor(String c){
    _carColor = c;
  }

  int get getYear => _year;
  set setYear(int y){
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

  int get getDoors => _carDoors;
  set setDoors(int d){
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