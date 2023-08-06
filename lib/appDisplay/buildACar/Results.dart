

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


class _Results extends State<Results>{

  @override
  Widget build(BuildContext context) {
    CarMatches matchLists = CarMatches(widget.user);
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(title: Text("Results Page"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemCount: matchLists.fullMatchesList.length,
          itemBuilder: (BuildContext context, int index){
            bool isPressed = false;
            return Container(
              padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
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
                          SizedBox(width: 15,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('\$50,000', style: TextStyle(fontSize: 20),),
                              Text('${matchLists.fullMatchesList[index].getMake} ${matchLists.fullMatchesList[index].getModel}', style: TextStyle(color: Colors.black),),
                              Text('Doors: ${matchLists.fullMatchesList[index].getDoors}'),
                              Text('Color: ${matchLists.fullMatchesList[index].getColor}'),
                            ],
                          ),
                          SizedBox(width: 40,),
                          Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.location_on_outlined, color: Colors.black),
                                    onPressed: () {
                                      showMap(context);
                                    },),
                                  SizedBox(width: 10,),
                                  IconButton(
                                    tooltip: 'Call Dealer',
                                      onPressed: () => launchUrl(Uri.parse("tel:+9154718850")),
                                      icon: Icon(Icons.phone, color: Colors.black,)
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
                                  SizedBox(width: 20,),
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
                                      icon: Icon(Icons.library_add_check)
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.circle_outlined, color: Colors.black,),
                          Text('Drive: ${matchLists.fullMatchesList[index].getDrive}'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.gas_meter_outlined, color: Colors.black,),
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
}