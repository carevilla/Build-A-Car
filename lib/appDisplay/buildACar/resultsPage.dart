

import 'package:buildacar/appDisplay/buildACar/userChoices.dart';
import 'package:buildacar/appDisplay/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('RESULTS'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Text("7 Matches", style: TextStyle(color: Colors.black),),
          matchLists.sevenMatches.length > 0 ?
          listMatch(matchLists.sevenMatches)
              : const Text("Not available"),
          Divider(height: 5, color: Colors.blue,),
          Text("6 Matches", style: TextStyle(color: Colors.black),),
          matchLists.sixMacthes.length > 0 ?
          listMatch(matchLists.sixMacthes)
              : const Text("Not available"),
          Divider(height: 5, color: Colors.blue,),
          Text("5 Matches", style: TextStyle(color: Colors.black),),
          matchLists.fiveMatches.length > 0 ?
          listMatch(matchLists.fiveMatches)
              : const Text("Not available"),
          Divider(height: 5, color: Colors.blue,),
          Text("4 Matches", style: TextStyle(color: Colors.black),),
          matchLists.fourMatches.length > 0 ?
          listMatch(matchLists.fourMatches)
              : const Text("Not available"),
          Divider(height: 5, color: Colors.blue,),
          Text("3 Matches", style: TextStyle(color: Colors.black),),
          matchLists.threeMatches.length > 0 ?
          listMatch(matchLists.threeMatches)
              : const Text("Not available"),
        ],
      ),

    );
  }

  Widget listMatch(List<Car> list) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(5),
              height: 150,
              color: Colors.grey.shade200,
              child: Center(
                child: Column(
                  children: [
                    Text('${list[index].getMake} ${list[index].getModel}', style: TextStyle(color: Colors.black),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.garage_sharp, color: toColor(list[index].getColor), size: 70,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Doors: ${list[index].getDoors}'),
                                    Text('Color: ${list[index].getColor}'),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.circle_outlined, color: Colors.black,),
                                Text('Drive: ${list[index].getDrive}'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.gas_meter_outlined, color: Colors.black,),
                                Text('FuelType: ${list[index].getFuelType}')
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              userDB.addToFavorites(list[index]);
                              debugPrint('Added to favs.');
                            },
                            icon: Icon(Icons.favorite_border_outlined),
                        )
                      ],
                    )
                  ],
                ),
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
}