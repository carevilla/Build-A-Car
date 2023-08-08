/// @author Christian Revilla
/// @author Leila Martinez

import 'package:flutter/material.dart';

/// Class that formats and displays the 5 tabs on homepage
class VehicleTab extends StatelessWidget{
  final String iconPath;

  const VehicleTab({super.key , required this.iconPath});

  /** Function to place the image associated with each tab
   * 5 total tabs; van, car, truck, sport, SUV
   * @return Widget representing the tab image
   * @param BuildContext context
   */
  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12)    
        ),
        child: Image.asset(
          iconPath,
          color: Colors.grey[600],
        ),
      )
    );
  }
}