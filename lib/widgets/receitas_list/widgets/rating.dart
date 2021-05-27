import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Rating extends StatelessWidget {
  final int? avaliacao;

  const Rating({Key? key, this.avaliacao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rating = avaliacao! * 0.05;
    return Row(
      children: [
        Text(
          '$rating',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 5),
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (ctx, _) => Icon(Icons.star, color: Colors.amber),
          itemCount: 5,
          itemSize: 16,
        ),
      ],
    );
  }
}
