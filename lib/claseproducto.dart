class Producto {
  int id;
  String nombre;
  String tipoCategoria;
  double precio;

  Producto({
    required this.id,
    required this.nombre,
    required this.tipoCategoria,
    required this.precio,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'tipo_categoria': tipoCategoria,
      'precio': precio,
    };
  }
}
