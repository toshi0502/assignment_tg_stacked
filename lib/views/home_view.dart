// home_screen.dart

import 'package:assignment_tg/models/home_view_model.dart';
import 'package:assignment_tg/services/navigation_service.dart';
import 'package:assignment_tg/views/screens/schedule_screen.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () =>
          HomeViewModel(NavigationService(GlobalKey<NavigatorState>())),
      builder: (context, model, child) => Scaffold(
        // Assign key to Scaffold
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScheduleScreen())),
                child: const Text('Scheduled View'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => model.navigateToMyActivityView(),
                child: const Text('My Activity View'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
