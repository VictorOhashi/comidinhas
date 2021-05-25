import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/views/authentication_view/authentication_viewmodel.dart';

import 'create_user_view.form.dart';

class CreateUserViewModel extends AuthenticationViewModel {
  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  @override
  String getName() => nameValue!;

  @override
  Future<FirebaseAuthenticationResult> runAuthentication() =>
      _firebaseAuthenticationService.createAccountWithEmail(
        email: emailValue!,
        password: passwordValue!,
      );
}
