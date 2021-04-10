import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
        Container(
          margin: EdgeInsets.fromLTRB(24, 0, 0, 0),
          height: 300,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.network(
                    "http://via.placeholder.com/288x188",
                    fit: BoxFit.fill,
                  ),
                  Material(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0)),
                    elevation: 4,
                    shadowColor: Color(0xFF4AC8EA),
                    child: ClipRect(
                      child: Banner(
                        color: Colors.green,
                        child: Container(
                          width: 288,
                          height: 80,
                          padding: EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Traget N°" + index.toString()),
                              Text(
                                " Date : 17/12/2020",
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        message: "3efef",
                        textDirection: TextDirection.ltr,
                        location: BannerLocation.bottomEnd,
                      ),
                    ),
                  )
                ],
              );
            },
            itemCount: 10,
            viewportFraction: 0.8,
            scale: 0.9,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
