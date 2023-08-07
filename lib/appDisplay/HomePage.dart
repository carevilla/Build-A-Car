
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../carTabs/car_tab.dart';
import '../carTabs/sportcar_tab.dart';
import '../carTabs/suv_tab.dart';
import '../carTabs/truck_tab.dart';
import '../carTabs/van_tab.dart';
import '../utilsTab/vehicle_tab.dart';
import 'buildACar/choose_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // List of Cars for home page
    List<Widget> appCars = const [
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
        body: Column(
          children: [
            // Text Welcome to Build-A-Car
            Padding(
              padding: EdgeInsets.all(15),
              child: searchBar(context),
            ),
            Container(
              height: 40,
              width: 250,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChooseModel()));
                  },
                  child: Text("Build Your Own"),
              ),
            ),
            const SizedBox(height: 10),

            //Tab Bar
            TabBar(
                tabs: appCars
            ),

            //Tab Bar View
            Expanded(
              child: TabBarView(
                children: [
                  // Simple car Page
                  CarTab(),

                  // Truck Page
                  TruckTab(),

                  // SUV Page
                  SUVTab(),

                  // Van Page
                  VanTab(),

                  // Sport Car Page
                  SportTab()
                ],
              ) ,
            )
          ],
        ),
      ),
    );
  }

  Widget searchBar(BuildContext context){

    return Container(
      height: 45,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8.0),
          hintText: 'Search...',
          // Add a clear button to the search bar
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () => _searchController.clear(),
          ),
          // Add a search icon or button to the search bar
          prefixIcon: IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Perform the search here
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}