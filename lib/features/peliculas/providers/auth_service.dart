import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/material.dart';


//ValueNotifier<AuthService> authService= ValueNotifier(AuthService());

class AuthService {
final FirebaseAuth auth = FirebaseAuth.instance;

User? get currentUser => auth.currentUser;

Stream<User?> get authStateChanges => auth.authStateChanges();

//login
//Future<UserCredential?> login({
  //required String email, 
  //required String password
  //}) async {
  //return await auth.signInWithEmailAndPassword(
    //email: email, password: password); }




//register
Future<UserCredential?> register({
  required String email, 
  required String password
  }) async {
  return await auth.createUserWithEmailAndPassword(
    email: email, password: password);}


//logout
Future<void> logout() async {
  await auth.signOut(); }

//reset password
Future<void> resetPassword({required String email}) async {
  await auth.sendPasswordResetEmail(email: email);}










}