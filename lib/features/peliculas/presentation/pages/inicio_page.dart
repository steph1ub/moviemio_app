import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:moviemio_app/core/utils/app_colors.dart';
import 'package:moviemio_app/features/peliculas/presentation/pages/favoritos_page.dart';
import 'package:moviemio_app/features/peliculas/presentation/pages/home_page.dart';
import 'package:moviemio_app/features/peliculas/presentation/pages/perfil_page.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({super.key});

  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  int _currentIndex = 0;

List<Widget> pages = [
HomePage(),
FavoritosPage(),
PerfilPage(),
];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 100,
        leadingWidth: 300,
        leading: Padding(padding: const EdgeInsets.all(0.5),
     
        child: Image.asset('assets/images/logo.png',fit: BoxFit.contain,),
        ),
        
         actions: [
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.menu),
    ),
    IconButton(
      onPressed: () {},
      icon: Icon(Icons.more_vert),
    ),],
    actionsIconTheme: IconThemeData(color: const Color.fromARGB(255, 255, 255, 255)),
     
     


backgroundColor: const Color.fromARGB(255, 22, 146, 241),
),
      body: pages[_currentIndex],
bottomNavigationBar: CurvedNavigationBar(
backgroundColor: Colors.transparent,
buttonBackgroundColor: AppColors.accentColor,
color: AppColors.primaryColor,
index: _currentIndex,
animationDuration: Duration(milliseconds: 300),
items:const[
 Icon(Icons.home, size: 30),
 Icon(Icons.movie, size: 30),
 Icon(Icons.person, size: 30),

],

onTap: (index) {
setState(() {
  _currentIndex = index;
});
},


),



    );
  }
}

