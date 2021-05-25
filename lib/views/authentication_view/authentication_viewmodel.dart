import 'package:comidinhas/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/exceptions/firestore_api_exception.dart';
import 'package:comidinhas/services/user_services.dart';
import 'package:comidinhas/models/application_models.dart';

abstract class AuthenticationViewModel extends FormViewModel {
  final log = getLogger('AuthenticationViewModel');

  final userService = locator<UserService>();
  final navigationService = locator<NavigationService>();

  final firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  @override
  void setFormStatus() {}

  String? getName();

  Future<FirebaseAuthenticationResult> runAuthentication();

  Future saveData() async {
    log.i('valued:$formValueMap');

    try {
      final result =
          await runBusyFuture(runAuthentication(), throwException: true);

      await _handleAuthenticationResponse(result);
    } on FirestoreApiException catch (e) {
      log.e(e.toString());
      setValidationMessage(e.toString());
    }
  }

  Future<void> _handleAuthenticationResponse(
      FirebaseAuthenticationResult authResult) async {
    log.v('authResult.hasError:${authResult.hasError}');

    if (!authResult.hasError && authResult.user != null) {
      final user = authResult.user!;

      await userService.syncOrCreateUserAccount(
        user: User(
          id: user.uid,
          email: user.email,
          name: getName(),
        ),
      );

      navigationService.clearStackAndShow(Routes.homeView);
    } else {
      if (!authResult.hasError && authResult.user == null) {
        log.wtf(
            'We have no error but the user is null. This should not be happening');
      }

      log.w('Authentication Failed: ${authResult.errorMessage}');

      setValidationMessage(authResult.errorMessage);
      notifyListeners();
    }
  }
}
