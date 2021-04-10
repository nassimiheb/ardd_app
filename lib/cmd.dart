import 'package:flutter/material.dart';

class Cmd extends StatefulWidget {
  @override
  _CmdState createState() => _CmdState();
}

class _CmdState extends State<Cmd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(left: 62),
      padding: const EdgeInsets.fromLTRB(0, 16, 12, 32),
      child: Center(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.73,
              child: Material(
                elevation: 5,
                type: MaterialType.canvas,
                clipBehavior: Clip.antiAlias,
                color: Color.fromRGBO(56, 4, 40, 0.9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xff504b45), Color(0xff3c3b37)],
                                stops: [0, 100])),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              ToolbarButton(
                                gradient: LinearGradient(colors: [
                                  Color(0xffef6e4e),
                                  Color(0xffe4582B)
                                ], stops: [
                                  0,
                                  100
                                ]),
                                child: Icon(Icons.close,
                                    size: 12, color: Colors.black38),
                              ),
                              SizedBox(width: 4),
                              ToolbarButton(
                                gradient: LinearGradient(colors: [
                                  Color(0xff7d7871),
                                  Color(0xff595953)
                                ], stops: [
                                  0,
                                  100
                                ]),
                                child: Text(
                                  "-",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black38),
                                ),
                              ),
                              SizedBox(width: 4),
                              ToolbarButton(
                                  gradient: LinearGradient(colors: [
                                    Color(0xff7d7871),
                                    Color(0xff595953)
                                  ], stops: [
                                    0,
                                    100
                                  ]),
                                  child: Container(
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      border: Border.all(color: Colors.black38),
                                    ),
                                  )),
                              SizedBox(width: 4),
                              Text(
                                "Jetson",
                                style: TextStyle(color: Color(0xffD5D0CE)),
                              )
                            ],
                          ),
                        )),
                    Container(
                        padding: const EdgeInsets.all(2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome to Jetson nano!",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ardd :#",
                                  style: TextStyle(color: Color(0xff87d441)),
                                ),
                                Expanded(
                                    child: TextField(
                                  autofocus: true,
                                  showCursor: true,
                                  cursorColor: Colors.white,
                                  cursorWidth: 6,
                                  style: TextStyle(color: Colors.white),
                                  decoration:
                                      InputDecoration.collapsed(hintText: ""),
                                ))
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              ))),
    ));
  }
}

class ToolbarButton extends StatelessWidget {
  final LinearGradient gradient;
  final Widget child;

  const ToolbarButton({Key key, this.gradient, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15,
      height: 15,
      alignment: Alignment.center,
      decoration: BoxDecoration(shape: BoxShape.circle, gradient: gradient),
      child: child,
    );
  }
}
