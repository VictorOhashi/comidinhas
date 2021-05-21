import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/app/app.router.dart';

import 'widgets/login_bottom_sheet.dart';

class ProfileViewModel extends BaseViewModel {
  final log = getLogger('ProfileViewModel');

  final NavigationService _navigationService = locator<NavigationService>();
  // TODO: final _userService = locator<UserService>();

  void goToLoginUser() {
    _navigationService.navigateTo(Routes.loginUserView);
  }

  void goToCreateUser() {
    _navigationService.navigateTo(Routes.createUserView);
  }

  Future showLoginBottomSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      builder: (ctx) => LoginBottomSheet(
        goToLoginUser: goToLoginUser,
        goToCreateUser: goToCreateUser,
      ),
    );
  }
}
