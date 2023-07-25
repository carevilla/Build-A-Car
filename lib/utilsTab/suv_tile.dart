import 'package:flutter/material.dart';

class SUVTile extends StatelessWidget {
  final String suvMake;
  final String suvModel;
  final String suvPrice;
  final suvColor;
  final String suvImage;

  const SUVTile({
    super.key,
    required this.suvMake,
    required this.suvModel,
    required this.suvPrice,
    required this.suvColor,
    required this.suvImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child:  Container(
        decoration: BoxDecoration(
          color: suvColor[50],
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
                      color: suvColor[100],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)
                      )
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '\$$suvPrice',
                    style: TextStyle(
                        color: suvColor,
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
                  suvImage,
                  height: 100,
                  width: 150,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            // car make/model
            Text(
              suvMake,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              suvModel,
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