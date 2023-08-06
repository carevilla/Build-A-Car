import 'package:buildacar/appDisplay/main.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:buildacar/dataAvailable/userData.dart';

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

  showCarInfo(context){
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
/*<<<<<<< HEAD
                  IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 36,
                    ),
                    onPressed: (){
                      //Add to favorites here !!!!!
                      notifyAddedToFavorites(context);
                    },
=======*/
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
//>>>>>>> 5df9700bd1e6457a7d34475ac09914e4117bf543
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