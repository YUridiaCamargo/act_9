import 'package:flutter/material.dart';
import 'guardardatosdiccionario.dart';

class CapturaProductos extends StatefulWidget {
  @override
  _CapturaProductosState createState() => _CapturaProductosState();
}

class _CapturaProductosState extends State<CapturaProductos> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _precioController = TextEditingController();
  
  // Agente para interactuar con el diccionario
  final GuardarDatosDiccionario _guardarDatos = GuardarDatosDiccionario();
  
  String? _categoriaSeleccionada;
  final List<String> _categorias = ['Galletas', 'Pasteles', 'Cupcakes'];

  void _guardarFormulario() {
    if (_formKey.currentState!.validate()) {
      _guardarDatos.guardarProducto(
        _nombreController.text,
        _categoriaSeleccionada ?? 'Otro',
        double.parse(_precioController.text),
      );
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('¡Producto guardado exitosamente!'),
          backgroundColor: Colors.green,
        ),
      );
      
      _nombreController.clear();
      _precioController.clear();
      setState(() {
        _categoriaSeleccionada = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        title: const Text('Capturar Productos', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF8E24AA),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Datos del Producto',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8E24AA),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                
                // Dato 1: ID Autonumérico (Visualmente Deshabilitado)
                TextFormField(
                  initialValue: 'Autonumérico',
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: 'ID (Auto)',
                    prefixIcon: const Icon(Icons.tag, color: Color(0xFFAB47BC)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(height: 15),

                // Dato 2: Nombre
                TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    prefixIcon: const Icon(Icons.cake_outlined, color: Color(0xFFAB47BC)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF8E24AA), width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) => value!.isEmpty ? 'Por favor ingrese el nombre' : null,
                ),
                const SizedBox(height: 15),

                // Dato 3: Categoría
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Tipo de Categoría',
                    prefixIcon: const Icon(Icons.category, color: Color(0xFFAB47BC)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  value: _categoriaSeleccionada,
                  items: _categorias.map((cat) {
                    return DropdownMenuItem(value: cat, child: Text(cat));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      _categoriaSeleccionada = val;
                    });
                  },
                  validator: (value) => value == null ? 'Seleccione una categoría' : null,
                ),
                const SizedBox(height: 15),

                // Dato 4: Precio
                TextFormField(
                  controller: _precioController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Precio (\$)',
                    prefixIcon: const Icon(Icons.monetization_on_outlined, color: Color(0xFFAB47BC)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF8E24AA), width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Por favor ingrese un precio';
                    if (double.tryParse(value) == null) return 'Ingrese un monto válido';
                    return null;
                  },
                ),
                const SizedBox(height: 30),

                // Botón Guardar
                ElevatedButton(
                  onPressed: _guardarFormulario,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: const Color(0xFF8E24AA),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    elevation: 5,
                  ),
                  child: const Text('Guardar Datos', style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
