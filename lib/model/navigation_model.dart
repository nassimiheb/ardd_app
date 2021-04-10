import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({this.title, this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: "Dashboard", icon: Icons.insert_chart),
  NavigationModel(title: "Manager", icon: Icons.power_settings_new ),
  NavigationModel(title: "Command line", icon: Icons.web_asset ),
  NavigationModel(title: "Map", icon: Icons.map_outlined ),
  NavigationModel(title: "Location ", icon: Icons.location_on_outlined ),
];