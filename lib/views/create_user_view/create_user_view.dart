import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'create_user_viewmodel.dart';

class CreateUserView extends StatelessWidget {
  const CreateUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateUserViewModel>.reactive(
      viewModelBuilder: () => CreateUserViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text('Criar conta'),
          centerTitle: true,
        ),
        body: Text(''),
      ),
    );
  }
}
