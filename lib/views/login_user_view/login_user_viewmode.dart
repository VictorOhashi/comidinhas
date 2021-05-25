import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/views/authentication_view/authentication_viewmodel.dart';

import 'login_user_view.form.dart';

class LoginUserViewModel extends AuthenticationViewModel {
  final FirebaseAuthenticationService? _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  @override
  String? getName() => null;

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService!.loginWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );
}
