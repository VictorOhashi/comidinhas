import 'package:stacked/stacked.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/models/application_models.dart';
import 'package:comidinhas/services/user_services.dart';

class ProfileViewModel extends BaseViewModel {
  final log = getLogger('ProfileViewModel');

  final UserService _userService = locator<UserService>();

  User get currentUser => _userService.currentUser!;
}
