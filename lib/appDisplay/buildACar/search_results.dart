

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatefulWidget {

  @override
  State<ResultsPage> createState() => _ResultsPage();

}

class _ResultsPage extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULTS PAGE'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),

    );
  }

}