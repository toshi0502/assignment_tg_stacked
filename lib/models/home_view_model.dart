// home_viewmodel.dart

import 'package:assignment_tg/routes.dart';
import 'package:assignment_tg/services/navigation_service.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  // final NavigationService _navigationService = locator<NavigationService>();

  final NavigationService _navigationService;

  HomeViewModel(
      this._navigationService); // Inject NavigationService in constructor

  Future<void> navigateToScheduledView() async {
    _navigationService.navigateTo(Routes['scheduledView']!);
  }

  Future<void> navigateToMyActivityView() async {
    _navigationService.navigateTo(Routes['myActivityView']!);
  }
}
