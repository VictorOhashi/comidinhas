import 'package:comidinhas/models/receita.dart';
import 'package:flutter/material.dart';

import 'widgets/receita_card.dart';

class ReceitasList extends StatelessWidget {
  final List<Receita> receitas;

  final Function(Receita receita) onClick;

  ReceitasList({
    Key? key,
    required this.receitas,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: receitas.length,
      itemBuilder: (ctx, index) {
        final receita = receitas[index];
        return ReceitaCard(receita, onClick);
      },
    );
  }
}
