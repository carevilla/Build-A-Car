import 'package:buildacar/appDisplay/accountPage/account.dart';
import 'package:buildacar/appDisplay/buildACar/choose_model.dart';
import 'package:buildacar/dataAvailable/cars_saveddata.dart';
import 'package:buildacar/dataAvailable/userData.dart';
import 'package:buildacar/serverCalls/car_query_call.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:buildacar/firebase_options.dart';
import 'package:provider/provider.dart';
import 'BuiltCars.dart';
import 'Favorites.dart';
import 'HomePage.dart';
import 'accountPage/utils.dart';


final carsListDB = CarListDB();
final userDB = UserDB();


Future<void> main() async {
  createList();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());


}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: UtilsAccount.messengerKey,
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        //useMaterial3: true,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  int _selectedIndex = 0;
  List<Widget> pageWidgets = [
    MyHomePage(),
    Favorites(),
    BuiltCars(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          elevation: 0,
          title: const Text("Build-A-Car", style: TextStyle(color: Colors.white),),
          centerTitle: true,
          actions: [
            Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                        size: 36,
                      ),
                      onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Account()));
                      },
                    ),
                  ],
                )
            )
          ],
        ),
      body: Center(
        child: pageWidgets[_selectedIndex],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        backgroundColor: Colors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.lightBlueAccent,
              ),
              child: Center(child: Column(
                children: [
                  const Icon(Icons.account_circle_sharp, color: Colors.black, size: 88,),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Account()));
                    },
                    child: const Text("Go to Account",
                      style: TextStyle(color: Colors.black),),
                  ),
                ],
              )),
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.home, color: Colors.black,),
                  SizedBox(width: 10,),
                  Text('Home',
                    style: TextStyle(fontSize: 16),),
                ],
              ),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.favorite, color: Colors.black,),
                  SizedBox(width: 10,),
                  Text('Favorites',
                  style: TextStyle(fontSize: 16),),
                ],
              ),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Row(
                children: [
                  Icon(Icons.garage_sharp, color: Colors.black,),
                  SizedBox(width: 10,),
                  Text('Built Cars',
                    style: TextStyle(fontSize: 16),),
                ],
              ),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }}

