import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:comidinhas/models/avaliacao.dart';
import 'package:comidinhas/utils/parse_avaliacao.dart';

class Rating extends StatelessWidget {
  final List<Avaliacao>? avaliacoes;

  const Rating({Key? key, required this.avaliacoes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rating = getAvaliacao(avaliacoes);
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (ctx, _) => Icon(Icons.star, color: Colors.amber),
      itemCount: 5,
      itemSize: 16,
    );
  }
}
