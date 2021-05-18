import 'package:comidinhas/constants/route_names.dart';
import 'package:comidinhas/locator.dart';
import 'package:comidinhas/services/authentication_services.dart';
import 'package:comidinhas/services/dialog_service.dart';
import 'package:comidinhas/services/navigation_service.dart';

import 'base_model.dart';

class LoginViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  final DialogService _dialogService = locator<DialogService>();

  final NavigationService _navigationService = locator<NavigationService>();

  Future login(String email, String password) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmail(email, password);

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(HomeRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General sign up failure.',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }
}
