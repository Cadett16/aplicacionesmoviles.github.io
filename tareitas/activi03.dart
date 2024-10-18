
// DULCERIA DE CHOCOLATES
import 'dart:io';

class Dulceria {
  Map<String, double> precios = {
    'Primor': 8.5,
    'Dulzura': 10.0,
    'Tentacion': 7.0, 
    'Explosion': 12.5, 
  };

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
}

void main() {
  Dulceria dulceria = Dulceria();

  print('Seleccione el tipo de chocolate:');
  dulceria.precios.forEach((tipo, precio) {
    print('$tipo: S/. $precio');
  });

  String tipoSeleccionado;
  try {
    tipoSeleccionado = stdin.readLineSync()!.trim();
    if (!dulceria.precios.containsKey(tipoSeleccionado)) {
      throw FormatException('Tipo de chocolate no válido.');
    }
  } catch (e) {
    print(e);
    return;
  }

  int cantidad;
  print('Ingresa la cantidad de chocolates:');
  try {
    cantidad = int.parse(stdin.readLineSync()!);
    if (cantidad <= 0) {
      throw FormatException('La cantidad debe ser un número mayor que cero.');
    }
  } catch (e) {
    print(e);
    return;
  }

  double precioUnitario = dulceria.precios[tipoSeleccionado]!;
  double importeTotal = dulceria.calcularImporte(precioUnitario, cantidad);
  double descuento = dulceria.calcularDescuento(importeTotal, cantidad);
  double importeFinal = dulceria.calcularImporteFinal(importeTotal, descuento);
  int caramelos = dulceria.calcularCaramelos(importeFinal, cantidad);

  print('\n--- Detalles de la Compra ---');
  print('Importe Total: S/. ${importeTotal.toStringAsFixed(2)}');
  print('Descuento: S/. ${descuento.toStringAsFixed(2)}');
  print('Importe a Pagar: S/. ${importeFinal.toStringAsFixed(2)}');
  print('Caramelos de Obsequio: $caramelos');
}
