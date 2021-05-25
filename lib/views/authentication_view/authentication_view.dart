import 'package:comidinhas/utils/text_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthenticationView extends StatelessWidget {
  final bool isCreating;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? nameController;
  final void Function() onSubmit;
  final String? validationMessage;
  final bool busy;

  const AuthenticationView({
    Key? key,
    required this.onSubmit,
    required this.emailController,
    required this.passwordController,
    required this.busy,
    this.nameController,
    this.isCreating = false,
    this.validationMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20),
          if (isCreating)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: TextField(
                decoration: InputDecoration(labelText: 'Nome de usuário'),
                controller: nameController,
                textCapitalization: TextCapitalization.none,
                inputFormatters: [LowerCaseTextFormatter()],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              decoration: InputDecoration(labelText: 'E-mail'),
              controller: emailController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: TextField(
              decoration: InputDecoration(labelText: 'Senha'),
              controller: passwordController,
              enableSuggestions: false,
              autocorrect: false,
              obscureText: true,
            ),
          ),
          if (validationMessage != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                validationMessage!,
                style: TextStyle(color: Colors.red, fontSize: 15),
              ),
            ),
          SizedBox(height: 10),
          Container(
            width: 250,
            child: ElevatedButton(
              onPressed: onSubmit,
              child: busy
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )
                  : Text(isCreating ? 'Nova conta!' : 'Entrar!'),
            ),
          ),
        ],
      ),
    );
  }
}
