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

  Future showCarInformation(context){
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text(''),
            content: Text('Answer saved '),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('close')),
              TextButton(
                  onPressed: (){},
                  child: const Text('Add to favorites'))
            ],
          ),
    );
  }


  carInfo(context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          child: Container(
            height: 200,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'What to remember'
                  ),
                ),
                SizedBox(
                  width: 320,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.greenAccent),
                    ),
                  )
                )
              ],
            ),
          )
        );
      }
    );
  }



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
            Expanded(
              child:Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22 , vertical: 8),
                child: Image.asset(
                  carImage,
                  //height: 100,
                  //width: 150,
                  fit: BoxFit.fitWidth,
                ),
              ),
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
                  IconButton(
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 36,
                    ),
                    onPressed: (){
                      print("hello");
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.grey[800],
                      size: 36,
                    ),
                    onPressed: (){
                      //showCarInformation(context);
                      carInfo(context);

                    },
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}