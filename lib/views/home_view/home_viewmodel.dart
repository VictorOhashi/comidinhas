import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/app/app.router.dart';
import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/services/receita_services.dart';
import 'package:comidinhas/services/user_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final log = getLogger('HomeViewModel');

  final NavigationService _navigationService = locator<NavigationService>();
  final UserService _userService = locator<UserService>();
  final ReceitaService _receitaService = locator<ReceitaService>();

  bool get hasCurrentUser => _userService.currentUser != null;

  List<Receita> _receitas = [];
  List<Receita> get receitas => _receitas;

  void goToReceitaDetail(Receita receita) {
    log.i("Opened receita: ${receita.documentId} ${receita.nome}");
    _navigationService.navigateTo(Routes.receitaView, arguments: receita);
  }

  void listenToReceitas() {
    setBusy(true);

    _receitaService.listenReceitas().listen((receitasData) {
      List<Receita> updatedReceitas = receitasData;
      if (updatedReceitas.length > 0) {
        _receitas = updatedReceitas;
        notifyListeners();
      }

      setBusy(false);
    });
  }
}
