import 'package:buildacar/appDisplay/account.dart';
import 'package:buildacar/appDisplay/user_list.dart';
import 'package:buildacar/utilsTab/vehicle_tab.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:buildacar/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // List of Cars for home page
    List<Widget> appCars = [
      // Car tab
      VehicleTab(
        iconPath: 'lib/Build-A-Car_pictures/TabCar.png'
      ),

      // Truck tab
      VehicleTab(
          iconPath: 'lib/Build-A-Car_pictures/TabTruck.png'
      ),

      // SUV tab
      VehicleTab(
          iconPath: 'lib/Build-A-Car_pictures/TabSUV.png'
      ),

      // Van tab
      VehicleTab(
          iconPath: 'lib/Build-A-Car_pictures/TabVan.png'
      ),

      // Sport car tab
      VehicleTab(
          iconPath: 'lib/Build-A-Car_pictures/TabSport.png'
      ),
    ];


    return DefaultTabController(
      length: appCars.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          elevation: 0,
          title: const Text("Build-A-Car", style: TextStyle(color: Colors.white),),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey[800],
                size: 36
              ),
              onPressed: (){
                //-- Open Menu Options here
              },
            )
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.grey[800],
                  size: 36,
                ),
                onPressed: (){
                  //-- Open User Login options
                },
              )
            )
          ],
        ),
        body: Column(
          children: [
            // Text Welcome to Build-A-Car
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36.0 , vertical: 18),
              child: Row(
                children: [
                  Text(
                    'Search ',
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(
                    'BUILD-A-CAR',
                    style: TextStyle(fontSize: 32 , fontWeight: FontWeight.bold),
                  )
                ], // children
              ),
            ),
            const SizedBox(height: 24),


            //Tab Bar
            TabBar(tabs: appCars),

            //Tab Bar View
          ],
        )


      /*
      bottomNavigationBar: Container(
        color: Colors.lightBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 30,),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListPage()));
                },
                icon: const Icon(Icons.format_list_bulleted, color: Colors.white, size: 30,)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Account()));
                },
                icon: const Icon(Icons.account_circle_rounded, color: Colors.white, size: 30))
          ],
        ),
      ),

      */


      ),
    );
  }
}
