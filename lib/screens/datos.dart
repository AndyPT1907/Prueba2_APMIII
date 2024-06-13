import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class Datos extends StatefulWidget {
  const Datos({super.key});

  @override
  _FirebaseDataPageState createState() => _FirebaseDataPageState();
}

class _FirebaseDataPageState extends State<Datos> {
  final databaseReference = FirebaseDatabase.instance.reference();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingresar Datos'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Ingrse los datos',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _Guardar(_controller.text);
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _Guardar(String data) {
    databaseReference.child('Datos Guardados').push().set({
      'mensaje': data,
      'timestamp': ServerValue.timestamp,
    }).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Guardado correctamente'),
        ),
      );
      _controller.clear();
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error $error'),
        ),
      );
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: Datos(),
  ));
}
