import 'dart:io';

class Chocolate {
  String tipo;
  double precio;

  Chocolate(this.tipo, this.precio);
}

class Dulceria {
  List<Chocolate> chocolates = [
    Chocolate('Primor', 8.5),
    Chocolate('Dulzura', 10.0),
    Chocolate('Tentacion', 7.0),
    Chocolate('Explosion', 12.5),
  ];

  double calcularImporte(double precioUnitario, int cantidad) {
    return precioUnitario * cantidad;
  }

  double calcularDescuento(double importeTotal, int cantidad) {
    double porcentajeDescuento;

    if (cantidad < 5) {
      porcentajeDescuento = 0.04;
    } else if (cantidad < 10) {
      porcentajeDescuento = 0.065;
    } else if (cantidad < 15) {
      porcentajeDescuento = 0.09;
    } else {
      porcentajeDescuento = 0.115;
    }

    return importeTotal * porcentajeDescuento;
  }

  double calcularImporteFinal(double importeTotal, double descuento) {
    return importeTotal - descuento;
  }

  int calcularCaramelos(double importeFinal, int cantidad) {
    return importeFinal >= 250 ? cantidad * 3 : cantidad * 2;
  }

  Chocolate obtenerChocolate(String tipo) {
    return chocolates.firstWhere(
      (chocolate) => chocolate.tipo.toLowerCase() == tipo.toLowerCase(),
      orElse: () => Chocolate('No encontrado', 0.0),
    );
  }
}

void main() {
  Dulceria dulceria = Dulceria();
  double importeTotal = 0.0;
  int totalCaramelos = 0;

  while (true) {
    print('Seleccione el tipo de chocolate:');
    dulceria.chocolates.forEach((chocolate) {
      print('${chocolate.tipo}: S/. ${chocolate.precio}');
    });

    String? tipoSeleccionado = stdin.readLineSync();
    if (tipoSeleccionado == null || tipoSeleccionado.isEmpty) {
      print('Por favor, ingrese un tipo de chocolate.');
      continue;
    }

    Chocolate chocolateSeleccionado = dulceria.obtenerChocolate(tipoSeleccionado);

    if (chocolateSeleccionado.tipo == 'No encontrado') {
      print('Tipo de chocolate no válido. Intenta de nuevo.');
      continue;
    }

    print('Ingresa la cantidad de chocolates:');
    int cantidad;

    while (true) {
      String? inputCantidad = stdin.readLineSync();
      if (inputCantidad == null || int.tryParse(inputCantidad) == null) {
        print('Por favor, ingresa un número válido para la cantidad.');
        continue;
      }
      cantidad = int.parse(inputCantidad);
      if (cantidad <= 0) {
        print('La cantidad debe ser mayor que cero. Intenta de nuevo.');
      } else {
        break; // Salir del bucle si la cantidad es válida
      }
    }

    double precioUnitario = chocolateSeleccionado.precio;
    double importe = dulceria.calcularImporte(precioUnitario, cantidad);
    double descuento = dulceria.calcularDescuento(importe, cantidad);
    double importeFinal = dulceria.calcularImporteFinal(importe, descuento);
    int caramelos = dulceria.calcularCaramelos(importeFinal, cantidad);

    // Acumula los totales
    importeTotal += importeFinal;
    totalCaramelos += caramelos;

    print('\n--- Detalles de la Compra para ${chocolateSeleccionado.tipo} ---');
    print('Importe Total: S/. ${importe.toStringAsFixed(2)}');
    print('Descuento: S/. ${descuento.toStringAsFixed(2)}');
    print('Importe a Pagar: S/. ${importeFinal.toStringAsFixed(2)}');
    print('Caramelos de Obsequio: $caramelos');

    print('\n¿Quieres agregar otro chocolate? (si/no)');
    String continuar = stdin.readLineSync()!.toLowerCase();
    if (continuar != 'si') {
      break; // Salir del bucle si el usuario no quiere continuar
    }
  }

  // Mostrar el total final y la cantidad de caramelos
  print('\n--- Resumen de la Compra ---');
  print('Importe Total a Pagar: S/. ${importeTotal.toStringAsFixed(2)}');
  print('Caramelos de Obsequio Totales: $totalCaramelos');
}
