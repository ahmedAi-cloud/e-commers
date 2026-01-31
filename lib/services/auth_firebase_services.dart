import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> login(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      
      print("Login Error: $e");
      return null;
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print("Register Error: $e");
      return null;
    }
  }

  Future<void> logout() async {
    await _auth.signOut(); 
  }
}