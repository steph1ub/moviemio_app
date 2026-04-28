import 'package:flutter/material.dart';
import 'package:moviemio_app/features/peliculas/presentation/pages/home_api.dart';
//import 'package:moviemio_app/features/peliculas/presentation/pages/home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(child: HomeApi(),),


    );
  }
}