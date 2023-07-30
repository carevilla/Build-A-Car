
abstract class Car {

  String _carColor = "";
  String _carBody = "";
  String _carModel = "";
  String _carMake = "";
  int _carDoors = 0;
  int _carYear = 0;
  String _carDrive = "";
  String _carFuelType = "";

  Car(this._carColor,
      this._carBody,
      this._carModel,
      this._carMake,
      this._carDoors,
      this._carYear,
      this._carDrive,
      this._carFuelType);

  String get getColor => _carColor;
  set setColor(String c){
    _carColor = c;
  }

  String get getBody => _carBody;
  set setBody(String b){
    _carBody = b;
  }

  int get getYear => _carYear;
  set setYear(int y){
    _carYear = y;
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