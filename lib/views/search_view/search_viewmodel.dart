import 'package:stacked/stacked.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/services/receita_services.dart';
import 'package:comidinhas/services/user_services.dart';
import 'package:comidinhas/models/application_models.dart';

class SearchViewModel extends BaseViewModel {
  final ReceitaService _receitaService = locator<ReceitaService>();
  final UserService _userService = locator<UserService>();

  List<ReceitaWithUser> _receitas = [];
  List<ReceitaWithUser> get receitas => _receitas;

  List<User> _pessoas = [];
  List<User> get pessoas => _pessoas;

  void searchReceitas(String nome) async {
    setBusy(true);

    _receitas = await Future.delayed(
      Duration(seconds: 1),
      () => _receitaService.searchReceitas(nome),
    );
    notifyListeners();

    setBusy(false);
  }

  void searchPessoas(String nome) async {
    setBusy(true);

    _pessoas = await Future.delayed(
      Duration(seconds: 1),
      () => _userService.searchUsers(nome),
    );
    notifyListeners();

    setBusy(false);
  }
}
