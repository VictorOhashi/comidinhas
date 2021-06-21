import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingModal extends StatefulWidget {
  final void Function(double rating) onRate;
  RatingModal({
    Key? key,
    required this.onRate,
  }) : super(key: key);

  @override
  _RatingModalState createState() => _RatingModalState();
}

class _RatingModalState extends State<RatingModal> {
  double _rating = 0;

  void openDialog(ctx) {
    showDialog(
      context: ctx,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'Avalie essa receita!',
          textAlign: TextAlign.center,
        ),
        content: Container(
          height: 35,
          width: double.infinity,
          alignment: Alignment.center,
          child: RatingBar(
            allowHalfRating: true,
            onRatingUpdate: (value) {
              setState(() {
                _rating = value;
              });
            },
            itemCount: 5,
            itemSize: 35,
            ratingWidget: RatingWidget(
              full: Icon(Icons.star, color: Colors.amber),
              half: Icon(
                Icons.star_half,
                color: Colors.amber,
              ),
              empty: Icon(
                Icons.star_border,
                color: Colors.amber,
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              widget.onRate(_rating);
              Navigator.pop(context);
            },
            child: const Text('Avaliar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => openDialog(context),
        child: Text(
          'Avaliar',
          style: TextStyle(fontSize: 16),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(2),
          padding: MaterialStateProperty.all(
            EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}
