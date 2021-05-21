import 'package:comidinhas/views/login_user_view/login_user_view.form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_user_viewmode.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginUserView extends StatelessWidget with $LoginUserView {
  LoginUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginUserViewModel>.reactive(
      viewModelBuilder: () => LoginUserViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Entrar com sua conta'),
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
              controller: emailController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
              controller: passwordController,
            ),
          ],
        ),
      ),
    );
  }
}
