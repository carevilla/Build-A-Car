/// @author Christian Revilla
/// @author Leila Martinez

/// Super class of all cars to be distributed when data is parsed from JSON
abstract class Car {
  String _carColor = "";
  String _carBody = "";
  String _carModel = "";
  String _carMake = "";
  String _carDoors = "";
  String _carYear = "";
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

  /** Getter function to get carColor
   * @return String representing the car color
   */
  String get getColor => _carColor;

  /** Setter function to set carColor
   * @param String representing the carColor to be set
   */
  set setColor(String c){
    _carColor = c;
  }

  /** Getter function to get carBody
   * @return String representing the car body
   */
  String get getBody => _carBody;

  /** Setter function to set carBody
   * @param String representing the carBody to be set
   */
  set setBody(String b){
    _carBody = b;
  }

  /** Getter function to get carYear
   * @return String representing the car year
   */
  String get getYear => _carYear;

  /** Setter function to set carYear
   * @param String representing the carYear to be set
   */
  set setYear(String y){
    _carYear = y;
  }

  /** Getter function to get carMake
   * @return String representing the car make
   */
  String get getMake => _carMake;

  /** Setter function to set carMake
   * @param String representing the carMake to be set
   */
  set setMake(String m) {
    _carMake = m;
  }

  /** Getter function to get carModel
   * @return String representing the car model
   */
  String get getModel => _carModel;

  /** Setter function to set carModel
   * @param String representing the carModel to be set
   */
  set setModel(String m){
    _carModel = m;
  }

  /** Getter function to get carDoors
   * @return String representing the car door
   */
  String get getDoors => _carDoors;

  /** Setter function to set carDoors
   * @param String representing the carDoors to be set
   */
  set setDoors(String d){
    _carDoors = d;
  }

  /** Getter function to get carDrive
   * @return String representing the car drive
   */
  String get getDrive => _carDrive;

  /** Setter function to set carDrive
   * @param String representing the carDrive to be set
   */
  set setDrive(String d){
    _carDrive = d;
  }

  /** Getter function to get carFuelType
   * @return String representing the car Fuel Type
   */
  String get getFuelType => _carFuelType;

  /** Setter function to set carFuelType
   * @param String representing the carFuelType to be set
   */
  set setFuelType(String f) {
    _carFuelType = f;
  }
}