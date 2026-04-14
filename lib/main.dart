import 'package:flutter/material.dart';
import 'inicio.dart';
import 'capturaproductos.dart';
import 'verproductos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Datos de Productos',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/inicio',
      routes: {
        '/inicio': (context) => Inicio(),
        '/captura': (context) => CapturaProductos(),
        '/ver': (context) => VerProductos(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
