import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService;

  HomeViewModel(this._navigationService);

  Future<void> navigateToScheduledView() async {
    _navigationService.navigateTo('/scheduled');
  }

  Future<void> navigateToMyActivityView() async {
    await _navigationService.navigateTo('/activity');
  }

  Future<void> navigateToEditScedule() async {
    await _navigationService.navigateTo('/editActivity');
  }
}
