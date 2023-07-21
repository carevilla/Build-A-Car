
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account.dart';
import 'main.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListPage();
}

class _ListPage extends State<ListPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text("Built Cars", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      bottomNavigationBar: Container(
        color: Colors.lightBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              icon: const Icon(Icons.home, color: Colors.white, size: 30,),
            ),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListPage()));
                },
                icon: const Icon(Icons.format_list_bulleted, color: Colors.white, size: 30,)),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Account()));
                },
                icon: const Icon(Icons.account_circle_rounded, color: Colors.white, size: 30))
          ],
        ),
      ),
    );
  }

}