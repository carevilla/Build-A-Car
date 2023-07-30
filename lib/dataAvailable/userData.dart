



import 'package:mobx/mobx.dart';
import '../serverCalls/car.dart';

part 'userData.g.dart';

class UserDB = userDataBase with _$UserDB;

abstract class userDataBase with Store {

  @observable
  List<Car> favorites = [];
  List<Car> buildedCars = [];

  @action
  void addToFavorites(Car c) {
    favorites.add(c);
  }

  @action
  void addToBuildedCars(Car c){
    buildedCars.add(c);
  }

}