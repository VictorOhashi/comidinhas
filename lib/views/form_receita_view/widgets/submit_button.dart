import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final void Function() onSubmit;
  final void Function()? onReturn;
  final String? text;
  final bool busy;

  const SubmitButton({
    Key? key,
    required this.onSubmit,
    this.text = 'Avançar >',
    this.busy = false,
    this.onReturn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: ElevatedButton(
            onPressed: onSubmit,
            child: Text(text!),
          ),
        ),
        if (onReturn != null)
          TextButton(
            onPressed: onReturn,
            child: Text(
              'voltar',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          )
      ],
    );
  }
}
