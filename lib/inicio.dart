import 'package:flutter/material.dart';

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5), // Color pastel elegante
      appBar: AppBar(
        title: const Text('Pastelería', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFF8E24AA), // Tono morado elegante
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.cake, size: 120, color: Color(0xFF8E24AA)),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/captura');
                },
                icon: const Icon(Icons.add_circle_outline, color: Colors.white),
                label: const Text('Capturar Productos', style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFAB47BC), // Morado suave
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  minimumSize: const Size(double.infinity, 60),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/ver');
                },
                icon: const Icon(Icons.list_alt, color: Colors.white),
                label: const Text('Ver Productos', style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7B1FA2), // Morado vibrante
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                  minimumSize: const Size(double.infinity, 60),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
