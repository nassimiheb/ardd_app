import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class Manager extends StatefulWidget {
  @override
  _ManagerState createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
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
            children: <Widget>[
              
             Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                    Text(
                        'Tap to start sending',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                SizedBox(
                  height: 20,
                ),
                AvatarGlow(
                  endRadius: 200.0,
                  animate: true,
                  child: GestureDetector(
                    onTap: () {
                     
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
       
        SizedBox(height: 16),
        
      ],
    )
           
            ],
          ),
        ),
      ),
    );
  }
}