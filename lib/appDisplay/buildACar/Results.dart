/// @author Christian Revilla
/// @author Leila Martinez

import 'package:buildacar/appDisplay/buildACar/userChoices.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import 'Matches.dart';


class Results extends StatefulWidget{
  late UserChoices user;

  Results(UserChoices u){
    user = u;
  }

  @override
  State<Results> createState() => _Results();
}

/// Class to represent Results Page after build process is complete
class _Results extends State<Results>{

  /** Build for the results page
   * Returns a ListView with the vehicles in order from most ot least matches
   * @return Widget representing The list of cars from API in result page
   * @param BuildContext context
   */
  @override
  Widget build(BuildContext context) {
    CarMatches matchLists = CarMatches(widget.user);
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(title: const Text("Results Page"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: matchLists.fullMatchesList.length,
          itemBuilder: (BuildContext context, int index){
            bool isPressed = false;
            return Container(
              padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
              height: 170,
              child: Card(
                color: Colors.white,
                elevation: 8,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.garage_sharp, color: toColor(matchLists.fullMatchesList[index].getColor), size: 100,),
                          const SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('\$50,000', style: TextStyle(fontSize: 20),),
                              Text('${matchLists.fullMatchesList[index].getMake} ${matchLists.fullMatchesList[index].getModel}', style: TextStyle(color: Colors.black),),
                              Text('Doors: ${matchLists.fullMatchesList[index].getDoors}'),
                              Text('Color: ${matchLists.fullMatchesList[index].getColor}'),
                            ],
                          ),
                          const SizedBox(width: 20,),
                          Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.location_on_outlined, color: Colors.black),
                                    onPressed: () {
                                      showMap(context);
                                    },),
                                  const SizedBox(width: 5,),
                                  IconButton(
                                    tooltip: 'Call Dealer',
                                      onPressed: () => launchUrl(Uri.parse("tel:+9154718850")),
                                      icon: const Icon(Icons.phone, color: Colors.black,)
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  FavoriteButton(
                                    iconSize: 35,
                                      isFavorite: false,
                                      valueChanged: (isFavorite) {
                                        if(isFavorite) {
                                          if(!userDB.favorites.contains(matchLists.fullMatchesList[index])){
                                            userDB.addToFavorites(matchLists.fullMatchesList[index]);
                                          } else {
                                            alreadyFavoritedNotification(context);
                                          }
                                          debugPrint("Add to faves");
                                        } else {
                                          debugPrint("Removed");
                                          userDB.removeFromFavorites(matchLists.fullMatchesList[index]);
                                        }
                                      }
                                  ),
                                  const SizedBox(width: 5,),
                                  IconButton(
                                    color: (isPressed) ? Colors.pink : Colors.grey,
                                      onPressed: () {

                                        setState(() {
                                          if(!isPressed){
                                            isPressed = true;
                                            if(!userDB.builtCars.contains(matchLists.fullMatchesList[index])){
                                              userDB.addToBuiltCars(matchLists.fullMatchesList[index]);
                                            } else {
                                              alreadyFavoritedNotification(context);
                                            }
                                          } else {
                                            isPressed == false;
                                            userDB.removeFromFavorites(matchLists.fullMatchesList[index]);
                                          }
                                        });

                                      },
                                      icon: const Icon(Icons.library_add_check)
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.circle_outlined, color: Colors.black,),
                          Text('Drive: ${matchLists.fullMatchesList[index].getDrive}'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.gas_meter_outlined, color: Colors.black,),
                          Text('FuelType: ${matchLists.fullMatchesList[index].getFuelType}',)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      )
    );
  }

  /** Function to convert from String to Colors
   * @return Color representing Color of vehicle
   * @param String representing the color to be converted
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

  /** Function to open up map image when user clicks info button
   * @return Future AlertBox representing map image
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

  /** Function to notify user that the vehicle is already in their favorites
   * @return Future AlertBox notify user vehicle is alrady in favorite
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
}