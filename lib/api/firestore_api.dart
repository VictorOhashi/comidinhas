import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/exceptions/firestore_api_exception.dart';
import 'package:comidinhas/models/application_models.dart';

class FirestoreApi {
  final log = getLogger('FirestoreApi');

  final CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser({required User user}) async {
    log.i('user:$user');

    try {
      final userDocument = userCollection.doc(user.id);
      await userDocument.set(user.toJson());
      log.v('UserCreated at ${userDocument.path}');
    } catch (error) {
      throw (FirestoreApiException(
        message: 'Failed to create new user',
        devDetails: '$error',
      ));
    }
  }

  Future<User?> getUser({required String userId}) async {
    log.i('userId:$userId');
    if (userId.isNotEmpty) {
      final userDoc = await userCollection.doc(userId).get();
      if (!userDoc.exists) {
        log.v('No user with id = $userId in database');
        return null;
      }

      final userData = userDoc.data();
      log.v('User found. Data: $userData');

      return User.fromJson(userData!);
    } else {
      throw (FirestoreApiException(
        message: 'Your userId passed in is empty',
      ));
    }
  }
}
