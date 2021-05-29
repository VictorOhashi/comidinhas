import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/widgets/receita_card.dart';
import 'package:flutter/material.dart';

class ReceitasList extends StatelessWidget {
  final List<ReceitaWithUser> receitas;
  final String title;
  final Color color;

  const ReceitasList({
    Key? key,
    required this.receitas,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: RichText(
              text: TextSpan(
                text: '$title - ',
                style: Theme.of(context).textTheme.bodyText2,
                children: [
                  TextSpan(
                    text: "${receitas.length}",
                    style: TextStyle(
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: receitas.length,
            itemBuilder: (ctx, index) {
              final receita = receitas[index];
              return ReceitaCard(receita);
            },
          ),
        ),
      ],
    );
  }
}
