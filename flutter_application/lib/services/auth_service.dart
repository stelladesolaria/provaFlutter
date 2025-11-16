import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? user;
  bool isLoading = true;

  AuthService() {
    _auth.authStateChanges().listen((u) {
      user = u;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> login(String email, String senha) async {
    try {
      isLoading = true; notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: senha);
    } finally {
      isLoading = false; notifyListeners();
    }
  }

  Future<void> register(String email, String senha) async {
    try {
      isLoading = true; notifyListeners();
      await _auth.createUserWithEmailAndPassword(email: email, password: senha);
    } finally {
      isLoading = false; notifyListeners();
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}