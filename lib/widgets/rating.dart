import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  final double? avaliacao;

  const Rating({Key? key, this.avaliacao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rating = avaliacao!;
    return RatingBarIndicator(
      rating: rating,
      itemBuilder: (ctx, _) => Icon(Icons.star, color: Colors.amber),
      itemCount: 5,
      itemSize: 16,
    );
  }
}
