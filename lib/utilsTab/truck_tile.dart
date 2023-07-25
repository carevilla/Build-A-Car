import 'package:flutter/material.dart';

class TruckTile extends StatelessWidget {
  final String truckMake;
  final String truckModel;
  final String truckPrice;
  final truckColor;
  final String truckImage;

  const TruckTile({
    super.key,
    required this.truckMake,
    required this.truckModel,
    required this.truckPrice,
    required this.truckColor,
    required this.truckImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child:  Container(
        decoration: BoxDecoration(
          color: truckColor[50],
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
                      color: truckColor[100],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)
                      )
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '\$$truckPrice',
                    style: TextStyle(
                        color: truckColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                ),

              ],
            ),
            // car picture
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22 , vertical: 8),
                child: Image.asset(
                  truckImage,
                  height: 100,
                  width: 150,
                 fit: BoxFit.fitWidth,
                ),
              ),
            ),
            // car make/model
            Text(
              truckMake,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              truckModel,
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