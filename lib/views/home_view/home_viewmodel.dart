import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/app/app.router.dart';
import 'package:comidinhas/models/application_models.dart';
import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/services/receita_services.dart';
import 'package:comidinhas/services/user_services.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final log = getLogger('HomeViewModel');

  final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  final ReceitaService _receitaService = locator<ReceitaService>();

  bool get hasCurrentUser => _userService.currentUser != null;

  List<ReceitaWithUser> _receitas = [];
  List<ReceitaWithUser> get receitas => _receitas;

  List<User> _users = [];
  List<User> get users => _users;

  void goToReceitaDetail(ReceitaWithUser receita) {
    log.i("Opened receita: ${receita.documentId} ${receita.nome}");
    _navigationService.navigateTo(Routes.receitaView, arguments: receita);
  }

  Future<void> getReceitas() async {
    setBusy(true);

    var receitasData = await _receitaService.getReceitas();

    for (var receita in receitasData) {
      final user = await _userService.getUser(userId: receita.userId);
      if (user != null) {
        _users.add(user);
      }
    }

    _receitas = receitasData
        .map((r) => ReceitaWithUser(
              user: _users.firstWhere((user) => user.id == r.userId),
              nome: r.nome,
              quantidadePessoas: r.quantidadePessoas,
              tempoPreparo: r.tempoPreparo,
              imagem: r.imagem,
              ingredientes: r.ingredientes,
              modoPreparo: r.modoPreparo,
              categorias: r.categorias,
              avaliacao: r.avaliacao,
              documentId: r.documentId,
            ))
        .toList();

    notifyListeners();

    setBusy(false);
  }
}
