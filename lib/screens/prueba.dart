import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prueba2/screens/login.dart';

class PruebaPage extends StatelessWidget {
  const PruebaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Nombre: Andy Tituaña'),
            const Text('Usuario de GitHub: AndyPT1907'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
