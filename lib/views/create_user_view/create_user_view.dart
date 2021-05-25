import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:comidinhas/views/authentication_view/authentication_view.dart';
import 'package:comidinhas/views/create_user_view/create_user_view.form.dart';

import 'create_user_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'name'),
  FormTextField(name: 'email'),
  FormTextField(name: 'password', isPassword: true),
])
class CreateUserView extends StatelessWidget with $CreateUserView {
  CreateUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateUserViewModel>.reactive(
      viewModelBuilder: () => CreateUserViewModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Criar conta'),
          centerTitle: true,
        ),
        body: AuthenticationView(
          isCreating: true,
          onSubmit: model.saveData,
          emailController: emailController,
          passwordController: passwordController,
          nameController: nameController,
          validationMessage: model.validationMessage,
          busy: model.isBusy,
        ),
      ),
    );
  }
}
