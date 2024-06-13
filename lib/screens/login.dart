import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba2/screens/cuenta.dart';
import 'package:prueba2/screens/datos.dart';
import 'package:prueba2/screens/registro.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Correo',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Datos()),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Error al ingresar')),
                      );
                    }
                  },
                  child: const Text('Iniciar Sesión'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegistroPage()),
                    );
                  },
                  child: const Text('Registrar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
