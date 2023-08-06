

import 'package:buildacar/appDisplay/buildACar/userChoices.dart';
import 'package:buildacar/appDisplay/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../serverCalls/car.dart';
import 'Matches.dart';

class ResultsPage extends StatefulWidget {

  late UserChoices user;

  ResultsPage(UserChoices userIn){
    user = userIn;
  }

  @override
  State<ResultsPage> createState() => _ResultsPage();

}

class _ResultsPage extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {

    CarMatches matchLists = CarMatches(widget.user);
    debugPrint(widget.user.getYear);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('RESULTS'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(10),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        ListView.builder(
                          itemCount: matchLists.threeMatches.length,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index){
                              Container(
                                  decoration: new BoxDecoration(color:Colors.red),
                                  child: Text(matchLists.threeMatches[index].getColor)
                              );
                            }
                        )
                      ],
                    );
                  },
                    /*
                    Text("7 Matches", style: TextStyle(color: Colors.black),),
                    matchLists.sevenMatches.length > 0 ?
                    listMatch(context,matchLists.sevenMatches)
                        : const Text("Not available"),
                    Divider(height: 5, color: Colors.blue,),
                    Text("6 Matches", style: TextStyle(color: Colors.black),),
                    matchLists.sixMacthes.length > 0 ?
                    listMatch(context,matchLists.sixMacthes)
                        : const Text("Not available"),
                    Divider(height: 5, color: Colors.blue,),
                    Text("5 Matches", style: TextStyle(color: Colors.black),),
                    matchLists.fiveMatches.length > 0 ?
                    listMatch(context, matchLists.fiveMatches)
                        : const Text("Not available"),
                    Divider(height: 5, color: Colors.blue,),
                    Text("4 Matches", style: TextStyle(color: Colors.black),),
                    matchLists.fourMatches.length > 0 ?
                    listMatch(context, matchLists.fourMatches)
                        : const Text("Not available"),
                    Divider(height: 5, color: Colors.blue,),


                    Text("3 Matches", style: TextStyle(color: Colors.black),),
                    matchLists.threeMatches.length > 0 ?
                    random(matchLists.threeMatches)
                        : const Text("Not available"),

                     */

                ),
            ),
          ],
        ),
      ),
      );
  }

  Widget random(List<Car> list){
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            Container(
                decoration: new BoxDecoration(color:Colors.red),
                child: Text(list[index].getColor)
            );
          }
      );
  }

  Widget listMatch(BuildContext context, List<Car> list){
    return Container(
      height: 100,
      width: 300,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemCount: userDB.favorites.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 170,
              child: Card(
                color: Colors.black,
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
      ),
    );
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
}