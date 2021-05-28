import 'package:comidinhas/widgets/circle_rouded_avatar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:comidinhas/models/receita.dart';

import 'receita_viewmodel.dart';
import 'widgets/ingredientes_card.dart';
import 'widgets/modo_preparo.dart';
import 'widgets/receita_badges.dart';

class ReceitaView extends StatelessWidget {
  const ReceitaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final receita = ModalRoute.of(context)!.settings.arguments as Receita;
    return ViewModelBuilder<ReceitaViewModel>.reactive(
      viewModelBuilder: () => ReceitaViewModel(),
      builder: (context, model, child) => Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (ctx, _) {
            return [
              SliverAppBar(
                pinned: true,
                expandedHeight: 180,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    receita.imagens[0],
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
                          child: Text(
                            receita.nome,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      ),
                      CircleRoudedAvatar(),
                    ],
                  ),
                ),
              ),
            ];
          },
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
