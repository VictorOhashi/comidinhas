import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'package:comidinhas/views/authentication_view/authentication_view.dart';

import 'login_user_view.form.dart';
import 'login_user_viewmode.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password', isPassword: true),
])
class LoginUserView extends StatelessWidget with $LoginUserView {
  LoginUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginUserViewModel>.reactive(
      viewModelBuilder: () => LoginUserViewModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Logar'),
          centerTitle: true,
        ),
        body: AuthenticationView(
          busy: model.isBusy,
          onSubmit: model.saveData,
          emailController: emailController,
          passwordController: passwordController,
          validationMessage: model.validationMessage,
        ),
      ),
    );
  }
}
