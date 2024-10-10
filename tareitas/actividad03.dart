import 'dart:io';

class Tienda {
  double porcentajeDescuento = 0.07; 

  double calcularImporteCompra(double precioCamisa, int cantidad) {
    return precioCamisa * cantidad;
  }

  double calcularPrimerDescuento(double importeCompra) {
    return importeCompra * porcentajeDescuento;
  }

  double calcularSegundoDescuento(double importeCompra, double primerDescuento) {
    double importeRestante = importeCompra - primerDescuento;
    return importeRestante * porcentajeDescuento;
  }

  double calcularDescuentoTotal(double primerDescuento, double segundoDescuento) {
    return primerDescuento + segundoDescuento;
  }

  double calcularImporteAPagar(double importeCompra, double descuentoTotal) {
    return importeCompra - descuentoTotal;
  }
}

void main() {

  Tienda tienda = Tienda();

  print('Ingresa el precio de la camisa:');
  double precioCamisa = double.parse(stdin.readLineSync()!);

  print('Ingresa la cantidad de unidades adquiridas:');
  int cantidad = int.parse(stdin.readLineSync()!);


  double importeCompra = tienda.calcularImporteCompra(precioCamisa, cantidad);
  double primerDescuento = tienda.calcularPrimerDescuento(importeCompra);
  double segundoDescuento = tienda.calcularSegundoDescuento(importeCompra, primerDescuento);
  double descuentoTotal = tienda.calcularDescuentoTotal(primerDescuento, segundoDescuento);
  double importeAPagar = tienda.calcularImporteAPagar(importeCompra, descuentoTotal);

  print('\n--- Detalles de la Compra ---');
  print('Importe de la compra: ${importeCompra.toStringAsFixed(2)}');
  print('Importe del primer descuento: ${primerDescuento.toStringAsFixed(2)}');
  print('Importe del segundo descuento: ${segundoDescuento.toStringAsFixed(2)}');
  print('Importe del descuento total: ${descuentoTotal.toStringAsFixed(2)}');
  print('Importe a pagar: ${importeAPagar.toStringAsFixed(2)}');
}
