import 'base_model.dart';

import '../locator.dart';
import '../services/authentication_services.dart';
import '../services/navigation_service.dart';

import '../constants/route_names.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final NavigationService _navigationService = locator<NavigationService>();

  Future checkUserLogIn() async {
    setBusy(true);

    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    setBusy(false);

    if (hasLoggedInUser) {
      _navigationService.replaceTo(HomeRoute);
    }
  }

  void goTo() {
    _navigationService.replaceTo(HomeRoute);
  }
}
