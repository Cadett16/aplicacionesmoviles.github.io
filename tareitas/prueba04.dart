import 'dart:io';

class Tienda {
  List<String> productos = ['P1', 'P2', 'P3'];
  List<double> precios = [15.0, 17.5, 20.0];

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

  double obtenerPrecio(String producto) {
    int index = productos.indexOf(producto);
    return index != -1 ? precios[index] : 0.0;
  }
}

void main() {
  Tienda tienda = Tienda();
  double importeTotalGeneral = 0.0;

  while (true) {
    print('Seleccione el tipo de producto:');
    for (int i = 0; i < tienda.productos.length; i++) {
      print('${tienda.productos[i]}: S/. ${tienda.precios[i]}');
    }

    String productoSeleccionado = stdin.readLineSync()!;
    if (!tienda.productos.contains(productoSeleccionado)) {
      print('Producto no válido.');
      continue; // Permite volver a seleccionar un producto
    }

    print('Ingresa la cantidad de unidades:');
    int cantidad;
    while (true) {
      String? inputCantidad = stdin.readLineSync();
      if (inputCantidad == null || int.tryParse(inputCantidad) == null || int.parse(inputCantidad) <= 0) {
        print('Por favor, ingresa un número válido para la cantidad.');
        continue;
      }
      cantidad = int.parse(inputCantidad);
      break; // Salir del bucle si la cantidad es válida
    }

    double precioUnitario = tienda.obtenerPrecio(productoSeleccionado);
    double importeTotal = tienda.calcularImporte(precioUnitario, cantidad);
    String regalo = tienda.determinarRegalo(cantidad);

    // Acumula el total general
    importeTotalGeneral += importeTotal;

    print('\n--- Detalles de la Compra ---');
    print('Importe Total: S/. ${importeTotal.toStringAsFixed(2)}');
    print('Regalo: $regalo');

    print('\n¿Desea agregar otro producto? (si/no)');
    String continuar = stdin.readLineSync()!.toLowerCase();
    if (continuar != 'si') {
      break; // Salir del bucle si el usuario no quiere continuar
    }
  }

  // Mostrar el total general al final
  print('\n--- Resumen de la Compra ---');
  print('Importe Total General a Pagar: S/. ${importeTotalGeneral.toStringAsFixed(2)}');
}
