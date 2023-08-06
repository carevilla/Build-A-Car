
import 'package:buildacar/appDisplay/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Favorites extends StatefulWidget {

  @override
  State<Favorites> createState() => _Favorites();
}

class _Favorites extends State<Favorites> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          hardcodedFaves(context),
          favoritesList(context),
        ],
      )
    );
  }

  Widget favoritesList(BuildContext context){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: userDB.favorites.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
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
                      Icon(Icons.garage_sharp, color: toColor(userDB.favorites[index].getColor), size: 100,),
                      SizedBox(width: 15,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('\$50,000', style: TextStyle(fontSize: 20),),
                          Text('${userDB.favorites[index].getMake} ${userDB.favorites[index].getModel}', style: TextStyle(color: Colors.black),),
                          Text('Doors: ${userDB.favorites[index].getDoors}'),
                          Text('Color: ${userDB.favorites[index].getColor}'),
                        ],
                      ),
                      SizedBox(width: 40,),
                      IconButton(
                        icon: Icon(Icons.location_on_outlined, color: Colors.black),
                        onPressed: () {
                          showMap(context);
                        },),
                      SizedBox(width: 10,),
                      IconButton(
                          onPressed: () => launchUrl(Uri.parse("tel:+9154718850")),
                          icon: Icon(Icons.phone, color: Colors.black,)
                          ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.circle_outlined, color: Colors.black,),
                      Text('Drive: ${userDB.favorites[index].getDrive}'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.gas_meter_outlined, color: Colors.black,),
                      Text('FuelType: ${userDB.favorites[index].getFuelType}',)
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  Widget hardcodedFaves(BuildContext context){
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: userDB.hardcodedFavorites.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 115,
                        height: 115,
                        child: Image.asset(userDB.hardcodedFavorites[index].carImage, fit: BoxFit.cover,),
                      ),
                      SizedBox(width: 15,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${userDB.hardcodedFavorites[index].carMake} ${userDB.hardcodedFavorites[index].carModel}', style: TextStyle(color: Colors.black),),
                          Text('\$${userDB.hardcodedFavorites[index].carPrice}')
                        ],
                      ),
                      SizedBox(width: 40,),
                      IconButton(
                        icon: Icon(Icons.location_on_outlined, color: Colors.black),
                        onPressed: () {
                          userDB.hardcodedFavorites[index].showMap(context);
                        },),
                      SizedBox(width: 10,),
                      Icon(Icons.phone, color: Colors.black)
                    ],
                  )
                ],
              ),
            ),
          );
        }
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

}