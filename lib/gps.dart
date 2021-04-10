import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

import 'listen_location.dart';
import 'service_enabled.dart';

class GPS extends StatefulWidget {
  @override
  _GPSState createState() => _GPSState();
}

class _GPSState extends State<GPS> {
  var sender;

  final Location location = Location();
  @override
  void initState() {
    super.initState();

    ///_uddp();
  }

  @override
  void dispose() {
    sender.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF089af8) ,
    
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left:62),
          padding: const EdgeInsets.all(32),
          child: Column(
            children: const <Widget>[
              // PermissionStatusWidget(),
              Divider(height: 16),
              ServiceEnabledWidget(),
              //Divider(height: 32),
              //GetLocationWidget(),
              //Divider(height: 32),
              ListenLocationWidget(),
              //Divider(height: 32),
              //EnableInBackgroundWidget(),
              //Divider(height: 32),
              //ChangeNotificationWidget()
            ],
          ),
        ),
      ),
    );
  }
}