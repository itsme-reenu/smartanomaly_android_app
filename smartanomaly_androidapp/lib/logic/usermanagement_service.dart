import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserManagementService {
final userData = ValueNotifier<User?>(null);
 final invalidUser = ValueNotifier<bool>(false);
 final FirebaseAuth _auth = FirebaseAuth.instance;

 UserManagementService() {
    init();
 }
 Future<void> init() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        userData.value = user;
      } else {
        userData.value = null;
      }
    });
 }

 Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (error) {
      invalidUser.value = !invalidUser.value;
    }
 }

 Future<void> signOut() async {
    await _auth.signOut();
 }
}