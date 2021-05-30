import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class BaseInfoReceita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Qual é o nome da sua receita?',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: TextField(
            decoration: InputDecoration(labelText: 'Nome'),
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Quanto tempo demora a receita?',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(height: 15),
        Container(
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberPicker(
                value: 1,
                onChanged: (value) => {},
                minValue: 0,
                maxValue: 100,
                itemWidth: 60,
                textMapper: (text) => int.parse(text) < 10 ? '0$text' : text,
              ),
              Text('hr.'),
              SizedBox(width: 20),
              NumberPicker(
                value: 100,
                onChanged: (value) => {},
                minValue: 0,
                maxValue: 100,
                itemWidth: 60,
                textMapper: (text) => int.parse(text) < 10 ? '0$text' : text,
              ),
              Text('min.'),
            ],
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Serve quantas pessoas?',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(height: 15),
        NumberPicker(
          value: 1,
          onChanged: (value) => {},
          minValue: 1,
          maxValue: 100,
          axis: Axis.horizontal,
          itemWidth: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black26),
          ),
        ),
      ],
    );
  }
}
