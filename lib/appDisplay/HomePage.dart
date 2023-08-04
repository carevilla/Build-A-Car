
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../carTabs/car_tab.dart';
import '../carTabs/sportcar_tab.dart';
import '../carTabs/suv_tab.dart';
import '../carTabs/truck_tab.dart';
import '../carTabs/van_tab.dart';
import '../utilsTab/vehicle_tab.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            const Padding(
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

}