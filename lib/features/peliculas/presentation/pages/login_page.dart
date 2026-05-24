import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moviemio_app/features/peliculas/presentation/pages/inicio_page.dart';
import 'package:moviemio_app/features/peliculas/presentation/pages/register_page.dart';
//import 'package:moviemio_app/features/peliculas/providers/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();  
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoading = false; 

Future<void> login() async {

    setState(() {
      isLoading = true;
    });

    try {

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
 if (!mounted) return;

     Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => const InicioPage(),
  ),
);

    } on FirebaseAuthException catch (e) {

      String message = 'Error';

      if (e.code == 'user-not-found') {
        message = 'Usuario no encontrado';
      } else if (e.code == 'wrong-password') {
        message = 'Contraseña incorrecta';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );

    } finally {

      setState(() {
        isLoading = false;
      });

    }
  }

//Future<void> register() async {

   // try {

     // await FirebaseAuth.instance.createUserWithEmailAndPassword(
       // email: emailController.text.trim(),
       // password: passwordController.text.trim(),
      //);
// if (!mounted) return;
  //    ScaffoldMessenger.of(context).showSnackBar(
    //    const SnackBar(content: Text('Usuario registrado')),
      //);

    //} on FirebaseAuthException catch (e) {

      //ScaffoldMessenger.of(context).showSnackBar(
        //SnackBar(content: Text(e.message ?? 'Error')),
      //);

    //}
 // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
            color: Colors.black.withValues(alpha: 0.4),
          ),
   

      Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo de la aplicación
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
      
        
              const Text(
                'Bienvenido a MovieMio App',
                  style: TextStyle(
                    color: Color.fromARGB(255, 94, 204, 250),
                    fontSize: 24,
                    fontWeight: FontWeight.bold, 

                  ),
              ),
             
              const Text(
                'Tu destino para descubrir las mejores películas y series.',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 14,
                ),
              ),
               //Espacio entre el texto y el siguiente
              const SizedBox(height: 20),

              //Campo de texto para el correo
              TextField(
                controller: emailController,
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                decoration: const InputDecoration(
                  labelText: 'Correo' , 
                  labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                   enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 1.0),
    ), 
     focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 72, 226, 240), width: 2.0),
      ),   


                ),
              ),
              //Espacio entre el campo de texto y el siguiente
              const SizedBox(height: 20),

              //Campo de texto para la contraseña
              TextField(
                controller: passwordController,
                style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña' ,
                  labelStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255), width: 1.0),
    ), 
     focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(255, 72, 226, 240), width: 2.0),
      ),   
                ),
              ),
              //Espacio entre el campo de texto y el botón
              const SizedBox(height: 30),
              //Botón de inicio de sesión
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : login,
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Iniciar sesión', style: TextStyle(color: Color.fromARGB(255, 31, 181, 246), fontSize: 17, fontWeight: FontWeight.bold),),
                ),
              ),
//Espacio entre el botón de inicio de sesión y el botón de registro
const SizedBox(height: 15),

              TextButton(
                onPressed : () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                child: const Text('¿No tienes una cuenta? Crea una', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),),
              ),
            

            ],
          ),
        ),
      ),




        ])
    ); }} 