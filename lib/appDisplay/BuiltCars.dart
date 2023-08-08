
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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.indigo,
        body: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: userDB.builtCars.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                height: 170,
                child: Slidable(
                  endActionPane: ActionPane(
                    extentRatio: .25,
                    motion: ScrollMotion(),
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
                              SizedBox(width: 5,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\$50,000', style: TextStyle(fontSize: 20),),
                                  Text('${userDB.builtCars[index].getMake} ${userDB.builtCars[index].getModel}',
                                    style: TextStyle(color: Colors.black),),
                                  Text('Doors: ${userDB.builtCars[index].getDoors}'),
                                  Text('Color: ${userDB.builtCars[index].getColor}'),
                                ],
                              ),
                              SizedBox(width: 40,),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(Icons.location_on_outlined,
                                            color: Colors.black),
                                        onPressed: () {
                                          showMap(context);
                                        },),
                                      SizedBox(width: 10,),
                                      IconButton(
                                          tooltip: 'Call Dealer',
                                          onPressed: () =>
                                              launchUrl(Uri.parse("tel:+9154718850")),
                                          icon: Icon(
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
                                      SizedBox(width: 20,),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.circle_outlined, color: Colors.black,),
                              Text('Drive: ${userDB.builtCars[index]
                                  .getDrive}'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
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

  Future alreadyFavoritedNotification(context){
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: const Text('Favorite'),
            content: Text('Already in favorites'),
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


  _deleteCar(BuildContext context, Car car) {
    return showDialog(
        context : context,
        barrierDismissible : false,
        builder : (BuildContext alertContext) {
          return AlertDialog(
              title : Text("Delete Built Car"),
              content : Text("Are you sure you want to delete?"),
              actions : [
                TextButton(child : Text("Cancel"),
                    onPressed: () => Navigator.of(alertContext).pop()
                ),
                TextButton(child : Text("Delete"),
                    onPressed : () {

                      userDB.removeFromBuiltCars(car);

                      Navigator.of(alertContext).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
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