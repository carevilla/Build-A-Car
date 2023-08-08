/// @author Christian Revilla
/// @author Leila Martinez
/// Class will save user's selected options
/// then the system will look up in the API

class UserChoices {
  String _carType = "";
  String _carColor = "";
  String _year = DateTime.now().year.toString();
  DateTime _dateTime = DateTime.now();
  String _carMake = "Make...";
  String _carModel = "Model...";
  String _carDoors = "";
  String _carDrive = "Drive...";
  String _carFuelType = "Fuel Type...";

  /// Getters and Setters for carType
  String get getCarType => _carType;
  set setCarType(String c){
    _carType = c;
  }

  /// Getters and setters for carColor
  String get getColor => _carColor;
  set setColor(String c){
    _carColor = c;
  }

  /// Getters and setters for year
  String get getYear => _year;
  set setYear(String y){
    _year = y;
  }

  /// Getters and setters for dateTime
  DateTime get getDate => _dateTime;
  set setDate(DateTime d){
    _dateTime = d;
  }

  /// Getters and setters for carMake
  String get getMake => _carMake;
  set setMake(String m) {
    _carMake = m;
  }

  /// Getters and setters for carModel
  String get getModel => _carModel;
  set setModel(String m){
    _carModel = m;
  }

  /// Getters and setters for carDoors
  String get getDoors => _carDoors;
  set setDoors(String d){
    _carDoors = d;
  }

  /// Getters and setters for carDrive
  String get getDrive => _carDrive;
  set setDrive(String d){
    _carDrive = d;
  }

  /// Getters and setters for carFuelType
  String get getFuelType => _carFuelType;
  set setFuelType(String f) {
    _carFuelType = f;
  }
}