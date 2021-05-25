import 'package:flutter/material.dart';

class LoginBottomSheet extends StatelessWidget {
  final goToLoginUser;
  final goToCreateUser;

  const LoginBottomSheet({Key? key, this.goToLoginUser, this.goToCreateUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Bem vindo(a) ao',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Comidinhas',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Container(
                width: 250,
                child: ElevatedButton(
                  onPressed: goToCreateUser,
                  child: Text('Crie sua conta'),
                ),
              ),
              TextButton(
                onPressed: goToLoginUser,
                child: Text(
                  'Já possui conta?',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
