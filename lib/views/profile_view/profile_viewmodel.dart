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

  User get currentUser => _userService.currentUser!;

  List<ReceitaWithUser> _favorites = [];
  List<ReceitaWithUser> get favorites => _favorites;

  List<ReceitaWithUser> _receitas = [];
  List<ReceitaWithUser> get receitas => _receitas;

  void logOut() {
    _firebaseAuthenticationService.logout();
  }

  Future<void> listenToFavorites() async {
    setBusy(true);

    _receitaService
        .listenReceitasWithId(ids: currentUser.favoritos)
        .listen((favoritesData) {
      List<ReceitaWithUser> updatedFavorites = favoritesData;
      if (updatedFavorites.length > 0) {
        _favorites = updatedFavorites;
        notifyListeners();
      }

      setBusy(false);
    });
  }

  Future<void> listenToUserReceitas() async {
    setBusy(true);

    _receitaService
        .listenReceitasWithId(ids: currentUser.receitas)
        .listen((receitasData) {
      List<ReceitaWithUser> updatedReceitas = receitasData;
      if (updatedReceitas.length > 0) {
        _receitas = updatedReceitas;
        notifyListeners();
      }

      setBusy(false);
    });
  }
}
