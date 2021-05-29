import 'package:comidinhas/widgets/circle_rouded_avatar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:comidinhas/models/receita.dart';

import 'receita_viewmodel.dart';
import 'widgets/favorite_button.dart';
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
              leading: InkWell(
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xCCFFFFFF),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                onTap: model.goBack,
              ),
              actions: [
                if (model.hasCurrentUser) FavoriteButton(receita.documentId)
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
                    CircleRoudedAvatar(receita.user.image!),
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
                  avaliacao: receita.avaliacao,
                ),
                IngredientesCard(ingredientes: receita.ingredientes),
                ModoPreparoCard(modoPreparo: receita.modoPreparo),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
