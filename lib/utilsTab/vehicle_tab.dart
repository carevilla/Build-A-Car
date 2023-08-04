import 'package:flutter/material.dart';

class VehicleTab extends StatelessWidget{
  final String iconPath;

  const VehicleTab({super.key , required this.iconPath});

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