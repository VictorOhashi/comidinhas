import 'package:firebase_auth/firebase_auth.dart';

import '../locator.dart';
import '../models/user_account.dart';
import 'user_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final UserService _userService = locator<UserService>();

  UserAccount _currentUser;
  UserAccount get currentUser => _currentUser;

  Future loginWithEmail(
    String email,
    String password,
  ) async {
    try {
      var authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _populateCurrentUser(authResult.user);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail(
    String email,
    String password,
    String name,
  ) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _currentUser = UserAccount(
        id: authResult.user.uid,
        email: email,
        name: name,
      );

      await _userService.createUser(_currentUser);

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    await _populateCurrentUser(user);
    return user != null;
  }

  Future _populateCurrentUser(User user) async {
    if (user != null) {
      _currentUser = await _userService.getUser(user.uid);
    }
  }
}
