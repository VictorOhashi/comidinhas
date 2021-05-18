import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_account.dart';

class UserService {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future createUser(UserAccount user) async {
    try {
      final userDocument = _usersCollection.doc(user.id);
      await userDocument.set(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      final userDocument = _usersCollection.doc(uid);
      var userData = await userDocument.get();

      return UserAccount.fromData(userData.data());
    } catch (e) {
      return e.message;
    }
  }
}
