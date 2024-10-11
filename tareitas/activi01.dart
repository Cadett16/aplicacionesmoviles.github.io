
// ALUMNOS CLASIFICADOS EN UNA UNIVERSIDAD

import 'dart:io';

void main() {
  
  String categoria;
  double promedio;
  

  print("Ingrese la categoría del estudiante (A, B, C, D):");
  categoria = stdin.readLineSync()!.toUpperCase();
  
  
  print("Ingrese el promedio ponderado del ciclo anterior (0 - 20):");
  promedio = double.parse(stdin.readLineSync()!);
  

  double pension;
  switch (categoria) {
    case 'A':
      pension = 550.0;
      break;
    case 'B':
      pension = 500.0;
      break;
    case 'C':
      pension = 460.0;
      break;
    case 'D':
      pension = 400.0;
      break;
    default:
      print("Categoría inválida.");
      return;
  }

  double descuento = 0.0;

  if (promedio >= 18.0) {
    descuento = 15.0;
  } else if (promedio >= 16.0) {
    descuento = 12.0;
  } else if (promedio >= 14.0) {
    descuento = 10.0;
  } else if (promedio >= 0.0 && promedio < 14.0) {
    descuento = 0.0;
  } else {
    print("Promedio inválido.");
    return;
  }

 
  double rebaja = (descuento / 100) * pension;

  double nuevaPension = pension - rebaja;

  print("\nPensión original: S/. ${pension.toStringAsFixed(2)}");
  print("Descuento aplicado: ${descuento.toStringAsFixed(2)}%");
  print("Rebaja: S/. ${rebaja.toStringAsFixed(2)}");
  print("Nueva pensión: S/. ${nuevaPension.toStringAsFixed(2)}");
}