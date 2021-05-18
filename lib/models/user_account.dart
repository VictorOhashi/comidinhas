import 'package:flutter/foundation.dart';

class UserAccount {
  final String id;
  final String email;
  final String name;

  UserAccount({
    @required this.id,
    @required this.email,
    @required this.name,
  });

  UserAccount.fromData(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        email = data['email'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
