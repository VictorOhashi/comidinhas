import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comidinhas/models/avaliacao.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/exceptions/firestore_api_exception.dart';
import 'package:comidinhas/models/application_models.dart';

class UserService {
  final log = getLogger('UserService');

  final CollectionReference<Map<String, dynamic>> _userCollection =
      FirebaseFirestore.instance.collection('users');

  final _firebaseAuthenticationService =
      locator<FirebaseAuthenticationService>();

  User? _currentUser;

  User? get currentUser => _currentUser;

  bool get hasLoggedInUser => _firebaseAuthenticationService.hasUser;

  Future<void> createUser({required User user}) async {
    log.i('user:$user');

    try {
      final userDocument = _userCollection.doc(user.id);
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
      final userDoc = await _userCollection.doc(userId).get();
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

  Future<List<User>> searchUsers(String nome) async {
    log.i('Search users with $nome');

    final userCollection =
        await _userCollection.where("nome", isGreaterThanOrEqualTo: nome).get();

    final usersDocs = userCollection.docs;

    log.v('Fetched ${usersDocs.length} users');

    return usersDocs.map((docs) => User.fromJson(docs.data())).toList();
  }

  Future<void> syncUserAccount() async {
    final firebaseUserId =
        _firebaseAuthenticationService.firebaseAuth.currentUser!.uid;

    log.v('Sync user $firebaseUserId');
    try {
      final userAccount = await getUser(userId: firebaseUserId);

      if (userAccount != null) {
        log.v('User account exists. Save as _currentUser');
        _currentUser = userAccount;
      }
    } catch (error) {
      throw (FirestoreApiException(
        message: 'Failed sync existing user',
        devDetails: '$error',
      ));
    }
  }

  Future<void> syncOrCreateUserAccount({required User user}) async {
    log.i('user:$user');

    await syncUserAccount();

    if (_currentUser == null) {
      log.v('We have no user account. Create a new user ...');
      await createUser(user: user);
      _currentUser = user;
      log.v('_currentUser has been saved');
    }
  }

  Future<void> favoriteReceita(receitaId) async {
    log.i('Favorite receita $receitaId');
    if (_currentUser != null) {
      var currentUser = _currentUser;
      try {
        var favReceitaIndex = currentUser!.favoritos!
            .indexWhere((favorito) => favorito == receitaId);

        if (favReceitaIndex >= 0) {
          currentUser.favoritos!.removeAt(favReceitaIndex);
        } else {
          currentUser.favoritos!.add(receitaId);
        }

        final userDocument = _userCollection.doc(currentUser.id);
        await userDocument.update({'favoritos': currentUser.favoritos});

        log.v('Receita favorited ${userDocument.path}');

        _currentUser = currentUser;
      } catch (error) {
        throw (FirestoreApiException(
          message: 'Failed to favorite receita $receitaId',
          devDetails: '$error',
        ));
      }
    }
  }

  Future<void> rateUser(User user, double rating) async {
    var userId = user.id;
    log.i('Rated user $userId with $rating starts');

    try {
      var avaliacoes = user.avaliacoes;

      var existingIndex = avaliacoes!.indexWhere((a) => a.id == userId);
      if (existingIndex >= 0) {
        avaliacoes.removeAt(existingIndex);
      }

      avaliacoes.add(Avaliacao(id: currentUser!.id, value: rating));

      await _userCollection.doc(userId).update(
        {'avaliacoes': avaliacoes.map((a) => a.toJson()).toList()},
      );
    } catch (error) {
      throw (FirestoreApiException(
        message: 'Failed to rate user $userId',
        devDetails: '$error',
      ));
    }
  }

  Future<void> addReceita(receitaId) async {
    log.i('Added receita to user ${_currentUser!.id}');

    var currentUser = _currentUser;
    try {
      var newReceita = currentUser!.receitas;
      newReceita!.add(receitaId);
      final userDocument = _userCollection.doc(currentUser.id);
      await userDocument.update({'receitas': newReceita});

      log.v('Receita favorited ${userDocument.path}');

      _currentUser = currentUser;
    } catch (error) {
      throw (FirestoreApiException(
        message: 'Failed to favorite receita $receitaId',
        devDetails: '$error',
      ));
    }
  }
}
