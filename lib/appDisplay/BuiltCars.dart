/// @author Christian Revilla
/// @author Leila Martinez

import 'package:buildacar/appDisplay/main.dart';
import 'package:buildacar/dataAvailable/userData.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../serverCalls/car.dart';

class BuiltCars extends StatefulWidget {

  @override
  State<BuiltCars> createState() => _BuiltCars();
}

class _BuiltCars extends State<BuiltCars> {

  /** Function that displays all vehicles in the BuiltCar List
   * Built via ListView,
   * each has slideable delete option,information, and icons associated with them
   * @return Widget displaying the List in BuiltCar List
   * @param BuildContext context
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        body: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: userDB.builtCars.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                height: 170,
                child: Slidable(
                  endActionPane: ActionPane(
                    extentRatio: .25,
                    motion: const ScrollMotion(),
                    children: <Widget>[
                      SlidableAction(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        label: "Delete",
                        icon: Icons.delete,
                        onPressed: (ctx) =>
                            _deleteCar(context, userDB.builtCars[index]),
                      )
                    ],
                  ),
                  child: Card(
                    color: Colors.white,
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.garage_sharp, color: toColor(
                                  userDB.builtCars[index].getColor),
                                size: 100,),
                              const SizedBox(width: 5,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '\$50,000', style: TextStyle(fontSize: 20),),
                                  Text('${userDB.builtCars[index].getMake} ${userDB.builtCars[index].getModel}',
                                    style: const TextStyle(color: Colors.black),),
                                  Text('Doors: ${userDB.builtCars[index].getDoors}'),
                                  Text('Color: ${userDB.builtCars[index].getColor}'),
                                ],
                              ),
                              const SizedBox(width: 40,),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.location_on_outlined,
                                            color: Colors.black),
                                        onPressed: () {
                                          showMap(context);
                                        },),
                                      const SizedBox(width: 10,),
                                      IconButton(
                                          tooltip: 'Call Dealer',
                                          onPressed: () =>
                                              launchUrl(Uri.parse("tel:+9154718850")),
                                          icon: const Icon(
                                            Icons.phone, color: Colors.black,)
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      FavoriteButton(
                                          iconSize: 35,
                                          isFavorite: false,
                                          valueChanged: (isFavorite) {
                                            if (isFavorite) {
                                              if (!userDB.favorites.contains(userDB.builtCars[index])) {
                                                userDB.addToFavorites(userDB.builtCars[index]);
                                              } else {
                                                alreadyFavoritedNotification(context);
                                              }
                                              debugPrint("Add to faves");
                                            } else {
                                              debugPrint("Removed");
                                              userDB.removeFromFavorites(userDB.builtCars[index]);
                                            }
                                          }
                                      ),
                                      const SizedBox(width: 20,),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.circle_outlined, color: Colors.black,),
                              Text('Drive: ${userDB.builtCars[index]
                                  .getDrive}'),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.gas_meter_outlined, color: Colors.black,),
                              Text('FuelType: ${userDB.builtCars[index]
                                  .getFuelType}',)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
        )
    );
  }

  /** Function to convert String to Colors to implement
   * @return Color to be used in database
   * @param String representing what color
   */
  Color toColor(String c){
    Color color = Colors.white;
    switch(c){
      case 'Black' : color = Colors.black;
      case 'White' : color = Colors.white;
      case 'Grey' : color = Colors.blueGrey;
      case 'Red' : color = Colors.red;
      case 'Blue': color = Colors.blue;
    }

    return color;
  }

  /** Function to display map image via AlertBox
   * @return Future AlertBox showing map image
   * @param BuildContext context
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

  /** Function to notify vehicle already in favorites via AlertBox
   * @return Future AlertBox showing car already favorited
   * @param BuildContext context
   */
  Future alreadyFavoritedNotification(context){
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Favorite'),
            content: const Text('Already in favorites'),
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


  /** Function to ask user if he wants to delete from List via AlertBox
   * Once confirmed vehicle is removed from List
   * @param BuildContext context
   * @param Car representing the vehicle that will be removed
   */
  _deleteCar(BuildContext context, Car car) {
    return showDialog(
        context : context,
        barrierDismissible : false,
        builder : (BuildContext alertContext) {
          return AlertDialog(
              title : const Text("Delete Built Car"),
              content : const Text("Are you sure you want to delete?"),
              actions : [
                TextButton(child : const Text("Cancel"),
                    onPressed: () => Navigator.of(alertContext).pop()
                ),
                TextButton(child : const Text("Delete"),
                    onPressed : () {

                      userDB.removeFromBuiltCars(car);

                      Navigator.of(alertContext).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              backgroundColor : Colors.red,
                              duration : Duration(seconds : 2),
                              content : Text("Car deleted")
                          )
                      );
                    }
                ) ]
          );
        }
    );
  }
}