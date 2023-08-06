// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userData.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserDB on userDataBase, Store {
  late final _$favoritesAtom =
      Atom(name: 'userDataBase.favorites', context: context);

  @override
  List<Car> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(List<Car> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  late final _$userDataBaseActionController =
      ActionController(name: 'userDataBase', context: context);

  @override
  void addToFavorites(Car c) {
    final _$actionInfo = _$userDataBaseActionController.startAction(
        name: 'userDataBase.addToFavorites');
    try {
      return super.addToFavorites(c);
    } finally {
      _$userDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToBuiltCars(Car c) {
    final _$actionInfo = _$userDataBaseActionController.startAction(
        name: 'userDataBase.addToBuiltCars');
    try {
      return super.addToBuiltCars(c);
    } finally {
      _$userDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToHardcodedFavorites(CarTile c) {
    final _$actionInfo = _$userDataBaseActionController.startAction(
        name: 'userDataBase.addToHardcodedFavorites');
    try {
      return super.addToHardcodedFavorites(c);
    } finally {
      _$userDataBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favorites: ${favorites}
    ''';
  }
}
