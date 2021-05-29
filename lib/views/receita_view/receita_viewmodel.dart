import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/services/user_services.dart';

class ReceitaViewModel extends BaseViewModel {
  final log = getLogger('ReceitaViewModel');

  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  bool _isFavorite = false;

  bool get isFavorite => _isFavorite;

  bool get hasCurrentUser => _userService.currentUser != null;

  void goBack() {
    _navigationService.back();
  }

  void checkFavorite(receitaId) {
    if (hasCurrentUser) {
      _isFavorite = _userService.currentUser!.favoritos!.contains(receitaId);
      notifyListeners();
    }
  }

  void favoriteReceita(id) async {
    setBusy(true);

    await _userService.favoriteReceita(id);
    checkFavorite(id);
    setBusy(false);
  }
}
