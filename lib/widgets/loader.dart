import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String text;

  const Loader({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(color: Theme.of(context).accentColor),
          )
        ],
      ),
    );
  }
}
