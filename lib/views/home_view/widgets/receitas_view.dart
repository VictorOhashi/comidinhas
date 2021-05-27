import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:comidinhas/widgets/receitas_list/receitas_list.dart';

import '../home_viewmodel.dart';

class ReceitasView extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Olá',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 10),
              Container(
                width: 230,
                child: Text(
                  'Qual prato vai querer fazer hoje?',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              SizedBox(height: 10),
              ReceitasList(receitas: viewModel.receitas)
            ],
          ),
        ),
      ),
    );
  }
}
