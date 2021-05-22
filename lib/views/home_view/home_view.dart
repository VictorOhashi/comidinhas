import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:comidinhas/views/profile_view/profile_view.dart';

import 'home_viewmodel.dart';
import 'widgets/bottom_navigation.dart';

class HomeView extends StatelessWidget {
  Widget _getViewForIndex(int index, BuildContext context) {
    switch (index) {
      case 1:
        return Scaffold(
          body: Text('Busca'),
        );
      case 2:
        return Scaffold(
          body: Text('Adicionar'),
        );
      case 3:
        return ProfileView();
      default:
        return SafeArea(
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
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ],
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: BottomNavigation(
          currentIndex: model.currentIndex,
          setIndex: model.setIndex,
        ),
        body: _getViewForIndex(model.currentIndex, context),
      ),
    );
  }
}