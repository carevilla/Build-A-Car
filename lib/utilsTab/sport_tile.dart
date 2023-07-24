import 'package:flutter/material.dart';

class SportTile extends StatelessWidget {
  final String sportMake;
  final String sportModel;
  final String sportPrice;
  final sportColor;
  final String sportImage;

  const SportTile({
    super.key,
    required this.sportMake,
    required this.sportModel,
    required this.sportPrice,
    required this.sportColor,
    required this.sportImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child:  Container(
        decoration: BoxDecoration(
          color: sportColor[50],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: sportColor[100],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)
                      )
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '\$$sportPrice',
                    style: TextStyle(
                        color: sportColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),

              ],
            ),
            // car picture
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22 , vertical: 8),
              child: Image.asset(
                sportImage,
                height: 100,
                width: 150,
                fit: BoxFit.fitWidth,
              ),
            ),
            // car make/model
            Text(
              sportMake,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              sportModel,
              style: TextStyle(
                  color: Colors.grey[700]
              ),
            ),
            const SizedBox(height: 10),
            // love and plus icon
            Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                        Icons.favorite,
                        color: Colors.pinkAccent[400]
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.grey[800],
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );



  }

}