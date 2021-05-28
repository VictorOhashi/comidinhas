import 'package:flutter/material.dart';

class CircleRoudedAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black87, width: 2),
      ),
      child: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(
            'https://conteudo.imguol.com.br/c/entretenimento/1d/2019/08/26/erick-jacquin-1566861608468_v2_1920x1280.jpg'),
      ),
    );
  }
}
