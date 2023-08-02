/*import 'package:flutter/material.dart';

class VanTile extends StatelessWidget {
  final String vanMake;
  final String vanModel;
  final String vanPrice;
  final vanColor;
  final String vanImage;

  const VanTile({
    super.key,
    required this.vanMake,
    required this.vanModel,
    required this.vanPrice,
    required this.vanColor,
    required this.vanImage,
  });


  Future notifyAnswerSaved(context){
    return showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
            title: Text('Status'),
            content: Text('Answer saved '),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Okay'))
            ],
          ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child:  Container(
        decoration: BoxDecoration(
          color: vanColor[50],
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
                      color: vanColor[100],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0)
                      )
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    '\$$vanPrice',
                    style: TextStyle(
                        color: vanColor,
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
                  vanImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            // car make/model
            Text(
              vanMake,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              vanModel,
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
                        //notifyAnswerSaved(context);
                        print("hello");
                        showDialog(
                          context: context,
                          builder: (context) =>
                              AlertDialog(
                                title: Text('Status'),
                                content: Text('Answer saved '),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Okay'))
                                ],
                              ),
                        );
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
*/
//}