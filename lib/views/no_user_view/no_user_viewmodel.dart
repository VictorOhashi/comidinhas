import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/app/app.router.dart';

import 'widgets/login_bottom_sheet.dart';

class NoUserViewModel extends BaseViewModel {
  final log = getLogger('NoUserViewModel');

  final NavigationService _navigationService = locator<NavigationService>();

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
        goToLoginUser,
        goToCreateUser,
      ),
    );
  }
}
