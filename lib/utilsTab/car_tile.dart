import 'package:flutter/material.dart';

class CarTile extends StatelessWidget {
  final String carMake;
  final String carModel;
  final String carPrice;
  final carColor;
  final String carImage;

  const CarTile({
    super.key,
    required this.carMake,
    required this.carModel,
    required this.carPrice,
    required this.carColor,
    required this.carImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child:  Container(
        decoration: BoxDecoration(
          color: carColor[50],
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
                    color: carColor[100],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)
                    )
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '\$$carPrice',
                    style: TextStyle(
                      color: carColor,
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
              child: Image.asset(carImage),
            ),
            // car make/model
            Text(
              carMake,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              carModel,
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