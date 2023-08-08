/// @author Christian Revilla
/// @author Leila Martinez
/// Main file to run app

import 'package:buildacar/appDisplay/accountPage/account.dart';
import 'package:buildacar/dataAvailable/cars_saveddata.dart';
import 'package:buildacar/dataAvailable/userData.dart';
import 'package:buildacar/serverCalls/car_query_call.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:buildacar/firebase_options.dart';
import 'BuiltCars.dart';
import 'Favorites.dart';
import 'HomePage.dart';
import 'accountPage/utils.dart';

final carsListDB = CarListDB();
final userDB = UserDB();

/** Function that initialize all configurations our app holds
 * firebase, MOBX, Global List
 * @return Future<void>
 */
Future<void> main() async {
  createList();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Stateless Build for main
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
      home: const StartPage(),
    );
  }
}

class StartPage extends StatefulWidget{
  const StartPage({super.key});


  @override
  State<StatefulWidget> createState() => _StartPage();
}

/** Start Page contains a Drawer or side menu where the user can open up
 * Favorites List, BuiltCar List, or the homepage
 */
class _StartPage extends State<StartPage> {
  int _selectedIndex = 0;
  List<Widget> pageWidgets = [
    const MyHomePage(),
    Favorites(),
    BuiltCars(),
  ];

  /** Function to set the correct state that shoudl be displayed
   * @return void
   * @param int index to know which widget to display
   */
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /** Build function that displays once app starts,
   * Defualt state it shows app bar, homepage layout, and side menu
   * @return Widget displaying current state of homepage
   * @param BuildContext context
   */
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
                      icon: const Icon(
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

