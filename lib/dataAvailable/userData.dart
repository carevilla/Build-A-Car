/// @author Christian Revilla
/// @author Leila Martinez

import 'package:mobx/mobx.dart';
import '../serverCalls/car.dart';
import '../utilsTab/car_tile.dart';

part 'userData.g.dart';

/// Class to access user globally anywhere in app
class UserDB = userDataBase with _$UserDB;

/// Class to define functions that add and remove to users List
abstract class userDataBase with Store {
  @observable
  List<Car> favorites = [];
  @observable
  List<Car> builtCars = [];
  @observable
  List<CarTile> hardcodedFavorites = [];

  /** Function to add car to Favorites list
   * @return void
   * @param Car representing the vehicle to be added to favorites list
   */
  @action
  void addToFavorites(Car c) {
    favorites.add(c);
  }

  /** Function to add car to BuiltCars list
   * @return void
   * @param Car representing the vehicle to be added to BuiltCars list
   */
  @action
  void addToBuiltCars(Car c){
    builtCars.add(c);
  }

  /** Function to add car to HardCodedFavorites list
   * used for demo purposes so the vehicle has an image with it
   * @return void
   * @param Car representing the vehicle to be added
   */
  @action
  void addToHardcodedFavorites(CarTile c){
    hardcodedFavorites.add(c);
  }

  /** Function to remove car to HardCodedFavorites list
   * used for demo purposes so the vehicle has an image with it
   * @return void
   * @param Car representing the vehicle to be removed
   */
  @action
  void removeFromHardcodedFavorites(CarTile c){
    hardcodedFavorites.remove(c);
  }

  /** Function to remove car from Favorites list
   * @return void
   * @param Car representing the vehicle to be removed from favorites
   */
  @action
  void removeFromFavorites(Car c){
    favorites.remove(c);
  }

  /** Function to remove car from BuiltCars list
   * @return void
   * @param Car representing the vehicle to be removed from BuiltCars list
   */
  @action
  void removeFromBuiltCars(Car c){
    builtCars.remove(c);
  }

}