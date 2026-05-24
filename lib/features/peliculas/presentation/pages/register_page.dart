
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moviemio_app/features/peliculas/presentation/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();  
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool isLoading = false;
  
  //VoidCallback? get login => null; 

// Método para registrar un nuevo usuario 
Future<void> register() async {

    try {

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
 if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario registrado')),
      );

    } on FirebaseAuthException catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Error')),
      );

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/register_bkg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
                   Container(
            color: Colors.black.withValues(alpha: 0.2),
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
                'Crea una cuenta',
                  style: TextStyle(
                    color: Color.fromARGB(255, 94, 204, 250),
                    fontSize: 24,
                    fontWeight: FontWeight.bold, 

                  ),
              ),
             
              const Text(
                'Únete a nuestra comunidad para descubrir las mejores películas y series.',
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


              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue.shade700,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                  onPressed: register,
                  child: const Text('Registrarse',
                     style: TextStyle(color: Color.fromARGB(255, 31, 181, 246), fontSize: 17, fontWeight: FontWeight.bold),),
                  
                ),
              ),
//Espacio entre el botón de inicio de sesión y el botón de registro
const SizedBox(height: 15),

              TextButton(
                onPressed : () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('¿Ya tienes una cuenta? Inicia sesión', style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),),
              ),
            

            ],
          ),
        ),
      ),




        ])

    );
  }
}