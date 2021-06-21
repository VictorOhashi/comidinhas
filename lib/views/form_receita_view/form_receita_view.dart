import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/views/form_receita_view/widgets/image_form.dart';
import 'package:comidinhas/views/form_receita_view/widgets/ingredientes_form.dart';
import 'package:comidinhas/views/form_receita_view/widgets/modo_preparo_form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'form_receita_viewmodel.dart';
import 'widgets/base_info_form.dart';

class FormReceitaView extends StatelessWidget {
  const FormReceitaView({Key? key}) : super(key: key);

  Widget _getFormPage(FormReceitaViewModel model) {
    switch (model.currentIndex) {
      case 1:
        return IngredientesForm(
          initialValue: model.formValueMap,
          onSubmit: model.nextPage,
          onReturn: model.returnPage,
        );
      case 2:
        return ModoPreparoForm(
          initialValue: model.formValueMap,
          onSubmit: model.nextPage,
          onReturn: model.returnPage,
        );
      case 3:
        return ImageForm(
          initialValue: model.formValueMap,
          onSubmit: model.nextPage,
          onReturn: model.returnPage,
          busy: model.isBusy,
        );
      default:
        return BaseInfoForm(
          initialValue: model.formValueMap,
          onSubmit: model.nextPage,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FormReceitaViewModel>.reactive(
      viewModelBuilder: () => FormReceitaViewModel(),
      onModelReady: (model) {
        var receita =
            ModalRoute.of(context)?.settings.arguments as ReceitaWithUser?;

        if (receita != null) {
          model.setEdittingReceita(receita);
        }
      },
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: _getFormPage(model),
            ),
          ),
        ),
      ),
    );
  }
}
