import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  Future<UserCredential>? signUp(String email, String password) {
    try {
      return FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      return null;
    }
  }

  Future<UserCredential>? signIn(String email, String password) {
    try {
      return FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on Exception catch (e) {
      return null;
    }
  }


}
