import 'package:mobx/mobx.dart';
import '../serverCalls/car.dart';
import '../utilsTab/car_tile.dart';

part 'userData.g.dart';

class UserDB = userDataBase with _$UserDB;

abstract class userDataBase with Store {

  @observable
  List<Car> favorites = [];
  List<Car> builtCars = [];
  List<CarTile> hardcodedFavorites = [];

  @action
  void addToFavorites(Car c) {
    favorites.add(c);
  }

  @action
  void addToBuiltCars(Car c){
    builtCars.add(c);
  }

  @action
  void addToHardcodedFavorites(CarTile c){
    hardcodedFavorites.add(c);
  }

}