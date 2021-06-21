import 'package:comidinhas/app/app.router.dart';
import 'package:comidinhas/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/models/application_models.dart';

import 'circle_rouded_avatar.dart';

class UserCard extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();

  final User user;

  UserCard(this.user);

  void goToUser() {
    _navigationService.navigateTo(Routes.profileView, arguments: user);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleRoudedAvatar(user.image),
          title: Text(user.nome!),
          subtitle: Rating(avaliacoes: user.avaliacoes),
          trailing: ElevatedButton(
            onPressed: goToUser,
            child: Text("Ver"),
          ),
        ),
      ),
    );
  }
}
