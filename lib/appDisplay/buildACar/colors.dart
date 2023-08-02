

import 'package:flutter/material.dart';

/**
Class stores the map of colors shown to the user to change the color of the cars svg.
 */

/// A Custom Slider that returns SVG colors and shades.
class SVGColorSlider extends StatelessWidget {

  /// Map holding the Theme.color:shade with its value
  final _colorMap = {
    'Black.black:#1B1B1B': Color.fromARGB(255, 0, 0, 0),
    'White.ghostwhite:white': Color.fromARGB(255, 255, 255, 255),
    'Grey.grey:#989797FF': Color.fromARGB(255, 152, 151, 151),
    'Silver.silver:#D5D5D5FF': Color.fromARGB(255, 213, 213, 213),
    'Red.red:#F93838': Color.fromARGB(255, 255, 0, 0),
    'Maroon.#800000:#930303': Color.fromARGB(255, 128, 0, 0),
    'Blue.blue:blue': Color.fromARGB(255, 0, 0, 255),
    'Navy.#0000CD:#0606ED': Color.fromARGB(255, 0, 0, 128),
    'Turquoise.#40E0D0:#00CED1': Color.fromARGB(255, 64, 224, 208),
    'Green.#22b14c:#26bf4e': Colors.green,
    'Bronze.#CD7F32:#D68943': Color.fromARGB(255, 82, 71, 65),
    'Yellow.#FFFF19:#FFFF19': Color.fromARGB(255, 255, 255, 0),
    'Gold.goldenrod:goldenrod': Color.fromARGB(255, 255, 215, 0),
    'Orange.#FF8C00:#FFA500': Color.fromARGB(255, 255, 165, 0),
    'Magenta.#FF00FF:#FA5AFF': Color.fromARGB(255, 255, 0, 255),
    'Purple.#6A0DAD:#7819CC': Colors.purple,
    //'Slate.#708090:#284646': Color.fromARGB(255, 112, 128, 144),
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