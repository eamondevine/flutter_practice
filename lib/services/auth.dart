import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:coffee_card/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on Firebase user
  UserOne? _userFromFirebaseUser(User? user) {
    return user != null ? UserOne(uid: user.uid) : null;
  }

  Stream<UserOne?> get user {
    return _auth.authStateChanges()
    // .map((User? user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser);
  }

  //sign in anonymously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  //sign in with email and password
  //register with email and password
  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
