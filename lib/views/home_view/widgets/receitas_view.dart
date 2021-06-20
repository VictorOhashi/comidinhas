import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:comidinhas/services/receita_services.dart';
// import 'package:comidinhas/views/home_view/widgets/categorias_list.dart';
import 'package:comidinhas/widgets/loader.dart';
import 'package:comidinhas/widgets/receita_card.dart';

import '../home_viewmodel.dart';

class ReceitasView extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá ${viewModel.hasCurrentUser ? viewModel.currentUser!.nome : ''},',
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
                  SizedBox(height: 20),
                  // CategoriasList(),
                ],
              ),
            ),
            if (viewModel.isBusy)
              Loader(
                text: 'Buscando receitas...',
              )
            else
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: viewModel.receitas.length,
                itemBuilder: (ctx, index) {
                  final receita = viewModel.receitas[index];

                  if (index % ReceitasLimit == 0) {
                    viewModel.requestMoreData();
                  }

                  return ReceitaCard(receita);
                },
              ),
          ],
        ),
      ),
    );
  }
}
