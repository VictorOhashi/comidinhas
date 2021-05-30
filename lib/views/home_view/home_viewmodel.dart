import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/app/app.router.dart';
import 'package:comidinhas/models/application_models.dart';
import 'package:comidinhas/models/categoria.dart';
import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/services/receita_services.dart';
import 'package:comidinhas/services/user_services.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final log = getLogger('HomeViewModel');

  final UserService _userService = locator<UserService>();
  final ReceitaService _receitaService = locator<ReceitaService>();

  bool get hasCurrentUser => _userService.currentUser != null;
  User? get currentUser => _userService.currentUser;

  List<ReceitaWithUser> _receitas = [];
  List<ReceitaWithUser> get receitas => _receitas;

  List<Categoria> _categorias = [];
  List<Categoria> get categorias => _categorias;

  List<User> _users = [];
  List<User> get users => _users;

  Future<void> getCategorias() async {
    var categoriasData = await _receitaService.getCategorias();
    _categorias = categoriasData;
  }

  Future<void> listenReceitas() async {
    setBusy(true);

    _receitaService.listenToReceitas().listen((receitasData) {
      List<ReceitaWithUser> updatedReceitas = receitasData;
      if (updatedReceitas.length > 0) {
        _receitas = updatedReceitas;
        notifyListeners();
      }

      setBusy(false);
    });
  }

  void requestMoreData() => _receitaService.requestMoreData();
}
