import 'dart:async';

import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/services/receita_services.dart';
import 'package:stacked/stacked.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/models/application_models.dart';
import 'package:comidinhas/services/user_services.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

class ProfileViewModel extends BaseViewModel {
  final log = getLogger('ProfileViewModel');

  final UserService _userService = locator<UserService>();
  final ReceitaService _receitaService = locator<ReceitaService>();

  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  User? _user;
  User get user => _user!;
  User? get currentUser => _userService.currentUser;
  bool get hasRating => currentUser?.id != null && currentUser?.id != user.id;

  List<ReceitaWithUser> _favorites = [];
  List<ReceitaWithUser> get favorites => _favorites;

  List<ReceitaWithUser> _receitas = [];
  List<ReceitaWithUser> get receitas => _receitas;

  void logOut() {
    _firebaseAuthenticationService.logout();
  }

  Future<void> fetchUserData(User? user) async {
    setBusy(true);

    _user = user != null ? user : _userService.currentUser;

    if (_user?.favoritos != null && _user!.favoritos!.length > 0) {
      _favorites =
          await _receitaService.getReceitasWithId(ids: _user!.favoritos);
    }
    if (_user?.receitas != null && _user!.receitas!.length > 0) {
      _receitas = await _receitaService.getReceitasWithId(ids: _user!.receitas);
    }

    notifyListeners();
    setBusy(false);
  }

  void rateUser(double rating) async {
    setBusy(true);

    if (_user != null) {
      await _userService.rateUser(_user!, rating);
    }

    setBusy(false);
  }
}
