/// @author Christian Revilla
/// @author Leila Martinez
/// This file represents the main Homepage of app

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

/// Class to represent State of Homepage app
class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();

  /** Build function for homepage
   *  Consist of search bar, 5 tabs that control what vehicles show on homepage
   *  @return Widget representing homepage
   *  @param BuildContext context
   */
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: searchBar(context),
            ),
            SizedBox(
              height: 40,
              width: 250,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ChooseModel()));
                  },
                  child: const Text("Build Your Own"),
              ),
            ),
            const SizedBox(height: 10),
            TabBar(
                tabs: appCars
            ),
            Expanded(
              child: TabBarView(
                children: [
                  CarTab(),
                  TruckTab(),
                  SUVTab(),
                  VanTab(),
                  SportTab()
                ],
              ) ,
            )
          ],
        ),
      ),
    );
  }

  /** Function to build a searchBar to be displayed on homepage
   * Currently no search features on it
   * @return Widget representing a search bar
   * @param BuildContext context
   */
  Widget searchBar(BuildContext context){
    return SizedBox(
      height: 45,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8.0),
          hintText: 'Search...',
          // Add a clear button to the search bar
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => _searchController.clear(),
          ),
          // Add a search icon or button to the search bar
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
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