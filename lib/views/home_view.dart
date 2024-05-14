import 'package:assignment_tg/models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:stacked_services/stacked_services.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(NavigationService()),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => model.navigateToScheduledView(),
                child: Text('Scheduled View'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => model.navigateToMyActivityView(),
                child: Text('My Activity View'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
