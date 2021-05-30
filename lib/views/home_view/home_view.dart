import 'package:comidinhas/views/form_receita_view/form_receita_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:comidinhas/views/home_view/widgets/receitas_view.dart';
import 'package:comidinhas/views/no_user_view/no_user_view.dart';
import 'package:comidinhas/views/profile_view/profile_view.dart';

import 'home_viewmodel.dart';
import 'widgets/bottom_navigation.dart';

class HomeView extends StatelessWidget {
  Widget _getViewForIndex(HomeViewModel model, BuildContext context) {
    switch (model.currentIndex) {
      case 1:
        return Scaffold(
          body: Text('Busca'),
        );
      case 2:
        return FormReceitaView();
      case 3:
        return model.hasCurrentUser ? ProfileView() : NoUserView();
      default:
        return ReceitasView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) async {
        await model.getCategorias();
        await model.listenReceitas();
      },
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: BottomNavigation(),
        body: _getViewForIndex(model, context),
      ),
    );
  }
}
