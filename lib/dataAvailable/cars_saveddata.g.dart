/// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_saveddata.dart';

/// **************************************************************************
/// StoreGenerator
/// **************************************************************************

/// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CarListDB on CarsListDataBase, Store {
  late final _$trucksListAtom =
      Atom(name: 'CarsListDataBase.trucksList', context: context);

  @override
  List<Car> get trucksList {
    _$trucksListAtom.reportRead();
    return super.trucksList;
  }

  @override
  set trucksList(List<Car> value) {
    _$trucksListAtom.reportWrite(value, super.trucksList, () {
      super.trucksList = value;
    });
  }

  late final _$CarsListDataBaseActionController =
      ActionController(name: 'CarsListDataBase', context: context);

  @override
  List<String> showAvailableYears(String carModel) {
    final _$actionInfo = _$CarsListDataBaseActionController.startAction(
        name: 'CarsListDataBase.showAvailableYears');
    try {
      return super.showAvailableYears(carModel);
    } finally {
      _$CarsListDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Car> listOfCarsByYear(String carModel, String selectedYear) {
    final _$actionInfo = _$CarsListDataBaseActionController.startAction(
        name: 'CarsListDataBase.listOfCarsByYear');
    try {
      return super.listOfCarsByYear(carModel, selectedYear);
    } finally {
      _$CarsListDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<String> showMake(String carModel, String yearSelected) {
    final _$actionInfo = _$CarsListDataBaseActionController.startAction(
        name: 'CarsListDataBase.showMake');
    try {
      return super.showMake(carModel, yearSelected);
    } finally {
      _$CarsListDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<String> showModels(String carModel, String year, String make) {
    final _$actionInfo = _$CarsListDataBaseActionController.startAction(
        name: 'CarsListDataBase.showModels');
    try {
      return super.showModels(carModel, year, make);
    } finally {
      _$CarsListDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<String> showDoors(
      String carModel, String year, String make, String model) {
    final _$actionInfo = _$CarsListDataBaseActionController.startAction(
        name: 'CarsListDataBase.showDoors');
    try {
      return super.showDoors(carModel, year, make, model);
    } finally {
      _$CarsListDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<String> showDrive(
      String carModel, String year, String make, String model) {
    final _$actionInfo = _$CarsListDataBaseActionController.startAction(
        name: 'CarsListDataBase.showDrive');
    try {
      return super.showDrive(carModel, year, make, model);
    } finally {
      _$CarsListDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<String> showFuelType(
      String carModel, String year, String make, String model) {
    final _$actionInfo = _$CarsListDataBaseActionController.startAction(
        name: 'CarsListDataBase.showFuelType');
    try {
      return super.showFuelType(carModel, year, make, model);
    } finally {
      _$CarsListDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Car> showResults(String carModel, String color, String make,
      String model, String fuelType, String drive, String doors, String year) {
    final _$actionInfo = _$CarsListDataBaseActionController.startAction(
        name: 'CarsListDataBase.showResults');
    try {
      return super.showResults(
          carModel, color, make, model, fuelType, drive, doors, year);
    } finally {
      _$CarsListDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
trucksList: ${trucksList}
    ''';
  }
}
