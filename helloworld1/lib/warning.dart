import 'package:flutter/material.dart';

class Warning extends StatefulWidget {
  @override
  _WarningState createState() => _WarningState();
}

class _WarningState extends State<Warning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        title: Center(child: Text('Warning')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(' This is for flight simulation only \nNOT to be used for real operations',style: TextStyle(
            color:Colors.white,
            fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}