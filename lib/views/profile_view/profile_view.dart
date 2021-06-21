import 'package:comidinhas/widgets/rating_modal.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:comidinhas/models/application_models.dart';
import 'package:comidinhas/widgets/loader.dart';

import 'profile_viewmodel.dart';
import 'widgets/profile_info.dart';
import 'widgets/receitas_list.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var user = ModalRoute.of(context)?.settings.arguments as User?;

    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      onModelReady: (model) => model.fetchUserData(user),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileInfo(),
                SizedBox(height: 15),
                if (model.isBusy)
                  Loader(
                    text: 'Carregando...',
                  )
                else
                  Column(
                    children: [
                      ReceitasList(
                        title: 'Favoritos',
                        receitas: model.favorites,
                        color: Colors.red,
                      ),
                      SizedBox(height: 15),
                      ReceitasList(
                        title: 'Receitas',
                        receitas: model.receitas,
                        color: Colors.blue.shade900,
                      ),
                      if (model.hasRating)
                        RatingModal(
                          onRate: (rating) => model.rateUser(rating),
                        ),
                    ],
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
