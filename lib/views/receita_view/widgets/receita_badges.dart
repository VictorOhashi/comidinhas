import 'package:flutter/material.dart';

import 'package:comidinhas/models/avaliacao.dart';
import 'package:comidinhas/utils/parse_avaliacao.dart';

class ReceitaBadges extends StatelessWidget {
  final int tempoPreparo;
  final int quantidadePessoas;
  final List<Avaliacao> avaliacoes;

  const ReceitaBadges({
    Key? key,
    required this.tempoPreparo,
    required this.quantidadePessoas,
    required this.avaliacoes,
  }) : super(key: key);

  Widget _buildBadge(
      {required String text,
      required Color color,
      IconData? icon,
      int? number}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: color,
      child: Container(
        width: 80,
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 50,
              )
            else
              FittedBox(
                child: Text(
                  '$number',
                  style: TextStyle(fontSize: 40),
                ),
              ),
            SizedBox(height: 5),
            FittedBox(
              child: Text(
                text,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final rating = getAvaliacao(avaliacoes);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBadge(
            color: Color(0xFFCEF7D7),
            text: '$tempoPreparo min',
            icon: Icons.access_time_rounded,
          ),
          _buildBadge(
            color: Color(0xFFF5E8D6),
            text: '$rating',
            icon: Icons.star_border,
          ),
          _buildBadge(
            color: Color(0xFFB8C0FF),
            text: 'Serve',
            number: quantidadePessoas,
          ),
        ],
      ),
    );
  }
}
