import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/widgets/circle_rouded_avatar.dart';
import 'package:comidinhas/widgets/receitas_list/widgets/rating.dart';
import 'package:flutter/material.dart';

class ReceitaCard extends StatelessWidget {
  final Receita receita;
  final Function(Receita receita) onClick;

  const ReceitaCard(this.receita, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          onClick(receita);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    receita.imagens[0],
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: -30,
                  left: 10,
                  child: CircleRoudedAvatar(),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 80, right: 10),
              child: Text(
                receita.nome,
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Rating(avaliacao: receita.avaliacao),
                  Row(
                    children: [
                      Icon(Icons.access_time_rounded, size: 18),
                      SizedBox(width: 5),
                      Text(
                        receita.tempoPreparo > 10
                            ? '${receita.tempoPreparo - 5} - ${receita.tempoPreparo + 5}'
                            : '${receita.tempoPreparo} min',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
