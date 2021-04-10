import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:avatar_glow/avatar_glow.dart';

class ListenLocationWidget extends StatefulWidget {
  const ListenLocationWidget({Key key}) : super(key: key);

  @override
  _ListenLocationState createState() => _ListenLocationState();
}

class _ListenLocationState extends State<ListenLocationWidget> {
  final Location location = Location();

  LocationData _location;
  StreamSubscription<LocationData> _locationSubscription;
  String _error;
  Timer timer;
  bool vm = true;

  @override
  void initState() {
    super.initState();
    vm = false;
    timer =
        Timer.periodic(Duration(seconds: 5), (Timer t) => _listenLocation());
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<void> _listenLocation() async {
    var myUrl = Uri.parse("http://192.168.1.40:5000");

    _locationSubscription =
        location.onLocationChanged.handleError((dynamic err) {
      setState(() {
        _error = err.code;
      });
      _locationSubscription.cancel();
    }).listen((LocationData currentLocation) {
      setState(() {
        _error = null;

        _location = currentLocation;
      });
    });
    if (vm) {
      print(vm);
      http.put(myUrl, body: {
        'long': _location.longitude.toString(),
        'lat': _location.latitude.toString()
      }).then((response) {
        print('Response status : ${response.statusCode}');
        print('Response body : ${response.body}');
      });
    }
  }

  /*Future<void> _stopListen() async {
    _locationSubscription.cancel();
 
    
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (vm)
                    ? Text(
                        'Tap to stop sending',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    : Text(
                        'Tap to start sending',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                SizedBox(
                  height: 20,
                ),
                AvatarGlow(
                  endRadius: 200.0,
                  animate: vm,
                  child: GestureDetector(
                    onTap: () {
                      if (vm) {
                        setState(() {
                          vm = false;
                        });
                      } else {
                        setState(() {
                          vm = true;
                        });
                      }
                    },
                    child: Material(
                      shape: CircleBorder(),
                      elevation: 8,
                      child: Container(
                        padding: EdgeInsets.all(40),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xFF042442)),
                        child: Image.asset(
                          'assets/loc.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
        Text(
          'Listen location',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 16),
        (_location != null)
            ? Text(
                '\t\t\t\tLongitude :\t\t\t\t\t' +
                    (_error ??
                        '${_location.longitude ?? "unknown"}' +
                            '\n\n\t\t\t\tLatitude :\t\t\t\t\t\t\t\t' +
                            '${_location.latitude ?? "unknown"}'),
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            : Text(
                ' Longitude : ' + 'unknown' + ' Latitude : ' + 'unknown',
                style: TextStyle(
                  color: Colors.white,
                ),
              )
      ],
    );
  }
}
