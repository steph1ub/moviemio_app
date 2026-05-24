import 'package:flutter/material.dart';
import 'package:moviemio_app/features/peliculas/presentation/pages/inicio_page.dart';
import 'package:moviemio_app/features/peliculas/presentation/pages/login_page.dart';
import 'package:moviemio_app/features/peliculas/providers/auth_service.dart';

class AuthState extends StatelessWidget {
  const AuthState({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthService(); 
    return Scaffold(
body: StreamBuilder(stream: auth.authStateChanges, builder: (context, snapshot) {
  if (snapshot.connectionState == ConnectionState.waiting) {
    return const Center(child: CircularProgressIndicator());
  } if (snapshot.hasData) {
    return InicioPage();
  } else {
    return LoginPage();
  } 
},),


    );
  }
}