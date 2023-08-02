import 'package:mobx/mobx.dart';
import '../serverCalls/car.dart';

part 'userData.g.dart';

class UserDB = userDataBase with _$UserDB;

abstract class userDataBase with Store {

  @observable
  List<Car> favorites = [];
  List<Car> builtCars = [];

  @action
  void addToFavorites(Car c) {
    favorites.add(c);
  }

  @action
  void addToBuiltCars(Car c){
    builtCars.add(c);
  }

  // @action -> Add a addToFavorites( to take The List car thats hardcoded)
  // flutter packages run build_runner watch

}