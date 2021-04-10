import 'package:flutter/material.dart';

class Ride extends StatefulWidget {
  @override
  _RideState createState() => _RideState();
}

class _RideState extends State<Ride> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Container(
          margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
          child: Text(
            "List of rides",
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 12),
       
       
      ],
    ));
  }
}