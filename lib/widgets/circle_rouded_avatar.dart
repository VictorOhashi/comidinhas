import 'package:flutter/material.dart';

class CircleRoudedAvatar extends StatelessWidget {
  final String image;

  const CircleRoudedAvatar(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black87, width: 2),
      ),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.grey.shade100,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}
