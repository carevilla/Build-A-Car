import 'package:flutter/material.dart';

class VehicleTab extends StatelessWidget{
  final String iconPath;

  const VehicleTab({super.key , required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 80,
      child: Container(
        child: Image.asset(
          iconPath,
          color: Colors.grey[600],
        ),
      )

    );
  }
}