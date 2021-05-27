import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/services/receita_services.dart';
import 'package:comidinhas/services/user_services.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final UserService _userService = locator<UserService>();
  final ReceitaService _receitaService = locator<ReceitaService>();

  bool get hasCurrentUser => _userService.currentUser != null;

  List<Receita> _receitas = [];
  List<Receita> get receitas => _receitas;

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
