import 'package:arddapp/dashboard.dart';
import 'package:arddapp/cmd.dart';
import 'package:arddapp/manager.dart';

import '../custom_navigation_drawer.dart';
import 'package:flutter/material.dart';

import '../data.dart';
import '../gps.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  CollapsingNavigationDrawerState createState() {
    return new CollapsingNavigationDrawerState();
  }
}

class CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer>
    with SingleTickerProviderStateMixin {
  double maxWidth = 210;
  double minWidth = 50;
  bool isCollapsed = false;
  AnimationController _animationController;
  Animation<double> widthAnimation;
  int currentSelectedIndex = 0;
  MyService _myService = MyService();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    widthAnimation = Tween<double>(begin: maxWidth, end: minWidth)
        .animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, widget) => getWidget(context, widget),
    );
  }

  Widget getWidget(context, widget) {
    return Material(
        elevation: 80.0,
        child: Stack(children: [
          GPS(), 
          getCustomContainer(),
           
          Material(
            elevation: 20,
            child: Container(
              width: widthAnimation.value,
              color: Color(0xFF042442),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 60),
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, counter) {
                        return Divider(height: 12.0);
                      },
                      itemBuilder: (context, counter) {
                        return CollapsingListTile(
                          onTap: () {
                            setState(() {
                              currentSelectedIndex = counter;
                              print(counter);
                              _myService.modifyscreen(counter);
                            });
                          },
                          isSelected: currentSelectedIndex == counter,
                          title: navigationItems[counter].title,
                          icon: navigationItems[counter].icon,
                          animationController: _animationController,
                        );
                      },
                      itemCount: navigationItems.length,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isCollapsed = !isCollapsed;
                        isCollapsed
                            ? _animationController.forward()
                            : _animationController.reverse();
                      });
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.close_menu,
                      progress: _animationController,
                      color: selectedColor,
                      size: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}

Widget getCustomContainer() {
  MyService _myService = MyService();
  switch (_myService.screen) {
    case 0:
      return Dashboard();
    case 1:
      return Manager();
    case 2:
      return Cmd();
    case 3:
      return Dashboard();
    
  }

  return Container();
}
