import 'package:flutter/material.dart';

import 'package:moviemio_app/features/peliculas/presentation/pages/inicio_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
  return Scaffold (
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome_bkg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
                   Container(
            color: Colors.black.withValues(alpha: 0.3),
          ),
           Container(
            padding: const EdgeInsets.all(0.8),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        
          Center(
            
            child: 
            
            Column(
              
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                const Text(
                  'Bienvenido a MovieMio App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,

                  ),
                ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: const Text(
                      'Tu destino para descubrir las mejores películas y series.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
         
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue.shade700,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
                  onPressed: () {
                    // Navegar a la página de inicio
                    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const InicioPage()),
  );
                  },
                  child: const Text('Comenzar',
                      style: TextStyle(
                        color: Color.fromRGBO(26, 165, 200, 1),
                        fontSize: 18,
                      )),
                  
                ),
         
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),



    );
  }
}



    