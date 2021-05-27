import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../no_user_viewmodel.dart';

class LoginBottomSheet extends ViewModelWidget<NoUserViewModel> {
  @override
  Widget build(BuildContext context, NoUserViewModel viewModel) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Bem vindo(a) ao',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Comidinhas',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: viewModel.goToCreateUser,
                  child: Text('Crie sua conta'),
                ),
              ),
              TextButton(
                onPressed: viewModel.goToLoginUser,
                child: Text(
                  'Já possui conta?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
