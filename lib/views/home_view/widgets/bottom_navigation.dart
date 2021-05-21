import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final void Function(int) setIndex;

  BottomNavigation({required this.currentIndex, required this.setIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: setIndex,
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
