import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/services/user_services.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final UserService _userService = locator<UserService>();

  bool get hasLoggedInUser => _userService.hasLoggedInUser;
}
