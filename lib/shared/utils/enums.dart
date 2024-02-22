// import 'package:antena/shared/app_texts.dart';
// import 'package:antena/theme/dart';
// import 'package:flutter/material.dart';

// //! car condtion
enum NavItem {
  dashboard('Dashboard'),
  ride('Manage Ride Orders'),
  drivers('Manage Drivers'),
  settings('Settings');

  const NavItem(this.label);
  final String label;
}

List<NavItem> navItems = [
  NavItem.dashboard,
  NavItem.ride,
  NavItem.drivers,
  NavItem.settings,
];
