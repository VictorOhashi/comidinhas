import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/widgets/circle_rouded_avatar.dart';
import 'package:comidinhas/widgets/icon_box.dart';
import 'package:comidinhas/widgets/rating_modal.dart';

import 'receita_viewmodel.dart';
import 'widgets/ingredientes_card.dart';
import 'widgets/modo_preparo.dart';
import 'widgets/receita_badges.dart';

class ReceitaView extends StatelessWidget {
  const ReceitaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final receita =
        ModalRoute.of(context)!.settings.arguments as ReceitaWithUser;

    return ViewModelBuilder<ReceitaViewModel>.reactive(
      viewModelBuilder: () => ReceitaViewModel(),
      onModelReady: (model) => model.checkFavorite(receita.documentId),
      builder: (context, model, child) => Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (ctx, _) => [
            SliverAppBar(
              pinned: true,
              expandedHeight: 180,
              leading: IconBox(
                icon: Icons.arrow_back,
                onTap: model.goBack,
              ),
              actions: [
                if (model.hasCurrentUser)
                  Container(
                    width: 56,
                    child: IconBox(
                      icon: model.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: model.isFavorite ? Colors.red : Colors.black87,
                      onTap: () => model.favoriteReceita(receita.documentId),
                    ),
                  ),
                if (model.currentUser == receita.user.id)
                  Container(
                    width: 56,
                    child: IconBox(
                      icon: Icons.edit,
                      color: Colors.black87,
                      onTap: () => model.editReceita(receita),
                    ),
                  ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  receita.imagem,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          receita.nome,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ),
                    CircleRoudedAvatar(receita.user.image),
                  ],
                ),
              ),
            ),
          ],
          body: SingleChildScrollView(
            child: Column(
              children: [
                ReceitaBadges(
                  tempoPreparo: receita.tempoPreparo,
                  quantidadePessoas: receita.quantidadePessoas,
                  avaliacoes: receita.avaliacoes,
                ),
                IngredientesCard(ingredientes: receita.ingredientes),
                ModoPreparoCard(modoPreparo: receita.modoPreparo),
                if (model.hasCurrentUser)
                  RatingModal(
                    onRate: (rating) => model.rateReceita(receita, rating),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
