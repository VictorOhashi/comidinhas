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

  User? _userToSearch;
  User get currentUser => _userToSearch!;

  List<ReceitaWithUser> _favorites = [];
  List<ReceitaWithUser> get favorites => _favorites;

  List<ReceitaWithUser> _receitas = [];
  List<ReceitaWithUser> get receitas => _receitas;

  void logOut() {
    _firebaseAuthenticationService.logout();
  }

  Future<void> fetchUserData(User? user) async {
    setBusy(true);

    _userToSearch = user != null ? user : _userService.currentUser;

    _favorites =
        await _receitaService.getReceitasWithId(ids: _userToSearch!.favoritos);

    _receitas =
        await _receitaService.getReceitasWithId(ids: _userToSearch!.receitas);

    notifyListeners();
    setBusy(false);
  }
}
