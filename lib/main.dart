import 'package:assignment_tg/views/home_view.dart';
import 'package:assignment_tg/views/screens/activity_screen.dart';
import 'package:assignment_tg/views/screens/editschedule_screen.dart';
import 'package:assignment_tg/views/screens/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  // setupLocator();
  runApp(const MyApp());
}

GetIt locator = GetIt.instance;

// void setupLocator() {
//   final locator = StackedServiceLocator.instance;

//  locator.registerSingleton<NavigationService>(()=>NavigationService());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/scheduled': (context) => ScheduleScreen(),
        '/activity': (context) => const ActivityScreen(),
        '/editActivity': (context) => EditScheduleScreen(
              schedule: {},
            )
      },
      // onGenerateRoute: Router.,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
