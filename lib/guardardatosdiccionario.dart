import 'claseproducto.dart';
import 'diccionarioproducto.dart';

class GuardarDatosDiccionario {
  // Función para generar un ID autonumérico
  int _generarId() {
    if (datosproductos.isEmpty) {
      return 1;
    }
    int maxId = datosproductos.keys.reduce((curr, next) => curr > next ? curr : next);
    return maxId + 1;
  }

  // Método de nivel principiante para modificar el diccionario
  void guardarProducto(String nombre, String tipoCategoria, double precio) {
    int nuevoId = _generarId();
    
    Producto nuevoProducto = Producto(
      id: nuevoId,
      nombre: nombre,
      tipoCategoria: tipoCategoria,
      precio: precio,
    );
    
    // Guardamos en el diccionario
    datosproductos[nuevoId] = nuevoProducto;
  }
}
