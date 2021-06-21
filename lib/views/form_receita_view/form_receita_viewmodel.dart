import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.router.dart';
import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/services/image_services.dart';
import 'package:comidinhas/services/receita_services.dart';
import 'package:comidinhas/services/user_services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class FormReceitaViewModel extends IndexTrackingViewModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final ImageService _imageService = locator<ImageService>();
  final ReceitaService _receitaService = locator<ReceitaService>();
  final UserService _userService = locator<UserService>();

  Map<String, dynamic> _formValueMap = Map<String, dynamic>();
  Map<String, dynamic> get formValueMap => _formValueMap;

  String? _receitaId;

  void setEdittingReceita(ReceitaWithUser receitaWithUser) {
    _receitaId = receitaWithUser.documentId;
    _formValueMap = receitaWithUser.receita.toMap();
  }

  Future<String> uploadImage() async {
    var imageFile = _formValueMap['imageFile'];
    var imagemUrl = _formValueMap['imagem'];

    if (imageFile != null && imagemUrl != null) {
      await _imageService.deleteImage(imagemUrl);
    }

    if (imageFile == null && imagemUrl != null) {
      return imagemUrl;
    }

    var imageResult = await _imageService.uploadImage(
      imageToUpload: imageFile,
      title: _formValueMap['nome'],
    );

    return imageResult.imageUrl;
  }

  void submitReceita() async {
    setBusy(true);
    final image = await uploadImage();

    _formValueMap["imagem"] = image;
    _formValueMap["userId"] = _userService.currentUser!.id;

    var receita = Receita.fromMap(_formValueMap, _receitaId);
    try {
      ReceitaWithUser result;
      if (_receitaId != null) {
        result = await _receitaService.updateReceita(receita);
        await _dialogService.showDialog(
          title: 'Receita Atualizada!',
        );
      } else {
        result = await _receitaService.addReceita(receita);
        await _userService.addReceita(result.documentId);

        await _dialogService.showDialog(
          title: 'Receita criada!',
        );
      }

      setIndex(0);
      _formValueMap = {};
      _navigationService.pushNamedAndRemoveUntil(
        Routes.receitaView,
        predicate: (route) => route.isFirst,
        arguments: result,
      );
    } catch (e) {
      await _dialogService.showDialog(
        title: 'Erro ao criar receita',
        description: e.toString(),
      );
    }
    setBusy(false);
  }

  void nextPage(Map<String, dynamic> data) {
    _formValueMap = _formValueMap..addAll(data);
    if (currentIndex + 1 <= 3) {
      setIndex(currentIndex + 1);
    } else {
      submitReceita();
    }
    notifyListeners();
  }

  void returnPage(Map<String, dynamic> data) {
    _formValueMap = _formValueMap..addAll(data);
    setIndex(currentIndex - 1);
    notifyListeners();
  }
}
