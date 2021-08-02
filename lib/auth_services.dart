import 'package:firebase_auth/firebase_auth.dart';
import "dart:async";

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User> signInAnonymous() async {
    try {
      final UserCredential authResult = await _auth.signInAnonymously();
      final User user = authResult.user;

      return user;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static Future<User> signUp(String email, String password) async {
    try {
      final UserCredential authResult = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User user = authResult.user;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static Future<User> signIn(String email, String password) async {
    try {
      final UserCredential authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final User user = authResult.user;
    } catch (e) {
      print(e.toString());

      return null;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<User> get onAuthStateChanged => _auth.authStateChanges();
}
