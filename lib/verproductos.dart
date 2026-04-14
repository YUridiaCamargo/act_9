import 'package:flutter/material.dart';
import 'diccionarioproducto.dart';

class VerProductos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        title: const Text('Ver Productos', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF8E24AA),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: datosproductos.isEmpty
          ? const Center(
              child: Text(
                'No hay productos registrados aún.',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: datosproductos.length,
              itemBuilder: (context, index) {
                int id = datosproductos.keys.elementAt(index);
                var producto = datosproductos[id]!;
                
                return Card(
                  margin: const EdgeInsets.only(bottom: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 4,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(15),
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xFFAB47BC),
                      radius: 25,
                      child: Icon(
                        producto.tipoCategoria == 'Galletas' ? Icons.cookie :
                        producto.tipoCategoria == 'Cupcakes' ? Icons.icecream : Icons.cake,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    title: Text(
                      producto.nombre,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'ID: ${producto.id} | Categoría: ${producto.tipoCategoria}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    trailing: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE1BEE7),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '\$${producto.precio.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6A1B9A),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
