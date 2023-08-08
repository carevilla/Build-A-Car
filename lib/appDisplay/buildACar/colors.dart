///@author Leila Martinez
///@author Christian Revilla

import 'package:flutter/material.dart';


/**
* Class stores the map of colors shown to the user to change the color of the cars svg.
 * 
 * */

/// A Custom Slider that returns SVG colors and shades.
class SVGColorSlider extends StatelessWidget {

  /// Map holding the Theme.color:shade with its value
  final _colorMap = {
    'Black.black:#1B1B1B': Color.fromARGB(255, 0, 0, 0),
    'White.ghostwhite:white': Color.fromARGB(255, 255, 255, 255),
    'Grey.grey:#989797FF': Color.fromARGB(255, 152, 151, 151),
    'Red.red:#F93838': Color.fromARGB(255, 255, 0, 0),
    'Blue.blue:blue': Color.fromARGB(255, 0, 0, 255),
  };

  /// Triggers when tapped on a color
  final Function(String) onColorSelected;

  SVGColorSlider({required this.onColorSelected});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        ..._colorMap.entries.map((MapEntry<String, Color> mapEntry) {           ///shows list of colors
          return InkWell(
            onTap: () => onColorSelected(mapEntry.key),
            child: Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  color: mapEntry.value,
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child:

                    /// Change The Font To Black For These Colors               /// displays the name of the color
                    mapEntry.key.contains('White') ||
                        mapEntry.key.contains('Beige') ||
                        mapEntry.key.contains('Yellow')
                        ? Text(
                        mapEntry.key
                            .split(':')[0]
                            .split('.')[0]
                            .toUpperCase(),
                        style: const TextStyle(
                          fontSize: 8.75,
                          fontWeight: FontWeight.bold,
                        ))
                        :

                    /// Else Let The Font Be white
                    Text(
                        mapEntry.key
                            .split(':')[0]
                            .split('.')[0]
                            .toUpperCase(),
                        style: const TextStyle(
                            fontSize: 8.75,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)))),
          );
        })
      ],
    );
  }
}