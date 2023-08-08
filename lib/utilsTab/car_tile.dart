/// @author Christian Revilla
/// @author Leila Martinez

import 'package:buildacar/appDisplay/main.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:buildacar/dataAvailable/userData.dart';

/// Class that represents the cars on the homepage
class CarTile extends StatelessWidget {
  final String carMake;
  final String carModel;
  final String carPrice;
  final carColor;
  final String carImage;

  const CarTile({
    super.key,
    required this.carMake,
    required this.carModel,
    required this.carPrice,
    required this.carColor,
    required this.carImage,
  });

  /** Function to show a map image when the map icon ping is clicked
   *  Location services to be implemented later
   *  @return Future AlertBox with map image
   *  @param BuildContext context
   */
  Future showMap(context){
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Map'),
            content: Image.asset('lib/Build-A-Car_pictures/GoogleMapTA.png'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          ),
    );
  }

  /** Function to notify vehicle was added to favorites list
   *  @return Future AlertBox notifying vehcile added to favorites
   *  @param BuildContext context
   */
  Future notifyAddedToFavorites(context){
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Favorite'),
            content: Text('$carMake $carModel added to your favorites'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          ),
    );
  }

  /** Function to notify vehicle was already in favorites list
   *  @return Future AlertBox notifying vehcile already in favorites
   *  @param BuildContext context
   */
  Future alreadyFavoritedNotification(context){
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Favorite'),
            content: Text('$carMake $carModel is already in favorites'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          ),
    );
  }

  /** Function to show additional information about specific vehicle
   * called when info icon is clicked from homepage
   * shows make, model, price, location, and phone number
   * @return void
   * @param BuildContext context
   */
  void showCarInfo(context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return Dialog(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
              child: Container(
                height: 200,
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text,
                    ListTile(
                      leading: const Icon(Icons.car_rental),
                      title: Text('$carMake $carModel'),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.map,
                          color: Colors.red,
                          size: 36,
                        ),
                        onPressed: (){
                          showMap(context);
                        },
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.monetization_on_outlined),
                      title: Text('Price \$$carPrice'),
                      trailing: const Icon(Icons.attach_money),
                    ),
                    const ListTile(
                      leading: Icon(Icons.house),
                      title: Text('Dealership near you 31 miles away!'),
                      trailing: Icon(Icons.add_ic_call)
                    ),
                  ],
                ),
              ),
          );
      }
    );
  }

  /** Build function that represents each car tile on homepage
   * A tile has the car image, make, model, and price associated with it
   * has a favorites and information icon button
   * @return Widget Showing the car tile on homepage
   * @param BuildContext context
   */
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child:  Container(
        decoration: BoxDecoration(
          color: carColor[50],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: carColor[100],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)
                    )
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '\$$carPrice',
                    style: TextStyle(
                      color: carColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  ),
                ),
              ],
            ),
            // car picture
            Expanded(
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22 , vertical: 8),
                child: Image.asset(
                  carImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            // car make/model
            Text(
              carMake,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              carModel,
              style: TextStyle(
                color: Colors.grey[700]
              ),
            ),
            const SizedBox(height: 10),
            // love and plus icon
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FavoriteButton(
                    isFavorite: false,
                    valueChanged: (isFavorite) {
                      if(isFavorite) {
                        if(!userDB.hardcodedFavorites.contains(this)){
                          userDB.addToHardcodedFavorites(this);
                          notifyAddedToFavorites(context);
                        } else {
                          alreadyFavoritedNotification(context);
                        }
                        debugPrint("Add to faves");
                      } else {
                        debugPrint("Removed");
                      }
                    }
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.grey[800],
                      size: 36,
                    ),
                    onPressed: (){
                      showCarInfo(context);
                    },
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}