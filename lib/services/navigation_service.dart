import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey;
  // final Navigator navigator;

  NavigationService(this.navigatorKey);

  void navigateTo(String routeName) {
    // Implement your navigation logic here using navigator.push or other methods
    print("Navigating to $routeName"); // Placeholder for now
  }
}
