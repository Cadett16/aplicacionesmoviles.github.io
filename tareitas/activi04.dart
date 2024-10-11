// TIENDA CON TRES PRODUCTOS

import 'dart:io';

class Tienda {
  Map<String, double> precios = {
    'P1': 15.0,
    'P2': 17.5,
    'P3': 20.0,
  };

  double calcularImporte(double precioUnitario, int cantidad) {
    return precioUnitario * cantidad;
  }

  String determinarRegalo(int cantidad) {
    if (cantidad < 26) {
      return 'Un lapicero';
    } else if (cantidad <= 50) {
      return 'Un cuaderno';
    } else {
      return 'Una agenda';
    }
  }
}

void main() {
  Tienda tienda = Tienda();

  print('Seleccione el tipo de producto:');
  tienda.precios.forEach((producto, precio) {
    print('$producto: S/. $precio');
  });

  String productoSeleccionado = stdin.readLineSync()!;
  if (!tienda.precios.containsKey(productoSeleccionado)) {
    print('Producto no válido.');
    return;
  }

  print('Ingresa la cantidad de unidades:');
  int cantidad = int.parse(stdin.readLineSync()!);

  double precioUnitario = tienda.precios[productoSeleccionado]!;
  double importeTotal = tienda.calcularImporte(precioUnitario, cantidad);
  String regalo = tienda.determinarRegalo(cantidad);

  print('\n--- Detalles de la Compra ---');
  print('Importe Total: S/. ${importeTotal.toStringAsFixed(2)}');
  print('Regalo: $regalo');
}
