import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/services/user_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.router.dart';

class InitViewViewModel extends BaseViewModel {
  final log = getLogger('InitViewViewModel');

  final NavigationService _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  void goToHome() {
    _navigationService.replaceWith(Routes.homeView);
  }

  Future<void> checkLogedUser() async {
    setBusy(true);

    if (_userService.hasLoggedInUser) {
      log.v('We have a user session on disk. Sync the user profile ...');
      await _userService.syncUserAccount();
      final currentUser = _userService.currentUser;

      if (currentUser != null) {
        log.v('User sync complete. User profile: $currentUser');
        goToHome();
      } else {
        setBusy(false);
      }
    } else {
      log.v('No user on disk, navigate to the LoginView');
    }

    setBusy(false);
  }
}
