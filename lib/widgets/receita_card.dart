import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/app/app.router.dart';
import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/widgets/circle_rouded_avatar.dart';
import 'package:comidinhas/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class ReceitaCard extends StatelessWidget {
  final log = getLogger('ReceitaCard');
  final NavigationService _navigationService = locator<NavigationService>();

  final ReceitaWithUser receita;

  ReceitaCard(this.receita);

  void goToReceitaDetail() {
    log.i("Opened receita: ${receita.documentId} ${receita.nome}");
    _navigationService.navigateTo(Routes.receitaView, arguments: receita);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: MediaQuery.of(context).size.width,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: goToReceitaDetail,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      receita.imagem,
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: -30,
                    left: 10,
                    child: CircleRoudedAvatar(receita.user.image!),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 80, right: 10, top: 10),
                child: Text(
                  receita.nome,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Por ',
                        style: TextStyle(color: Colors.black45),
                        children: [
                          TextSpan(
                            text: receita.user.nome,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_rounded, size: 18),
                        SizedBox(width: 5),
                        Text(
                          '${receita.tempoPreparo} min',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Rating(avaliacao: receita.avaliacao),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
