// Assuming you know your route names
// ignore: constant_identifier_names
import 'package:assignment_tg/views/home_view.dart';
import 'package:assignment_tg/views/screens/activity_screen.dart';
import 'package:assignment_tg/views/screens/schedule_screen.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/scheduled':
        return MaterialPageRoute(builder: (_) => ScheduleScreen());
      case '/activity':
        return MaterialPageRoute(builder: (_) => ActivityScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
