import 'package:stacked/stacked.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/models/application_models.dart';
import 'package:comidinhas/services/user_services.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class ProfileViewModel extends BaseViewModel {
  final log = getLogger('ProfileViewModel');

  final UserService _userService = locator<UserService>();
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  User get currentUser => _userService.currentUser!;

  void logOut() {
    _firebaseAuthenticationService.logout();
  }
}
