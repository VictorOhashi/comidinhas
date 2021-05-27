import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../home_viewmodel.dart';

class BottomNavigation extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: viewModel.currentIndex,
      onTap: viewModel.setIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Início',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Busca',
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: 'Adicionar',
          icon: Icon(Icons.add_box),
        ),
        BottomNavigationBarItem(
          label: 'Perfil',
          icon: Icon(Icons.account_circle),
        ),
      ],
    );
  }
}
