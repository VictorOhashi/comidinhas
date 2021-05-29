import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Text(model.currentUser.nome!),
              ElevatedButton(
                onPressed: model.logOut,
                child: Text('Sair'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
