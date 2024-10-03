import 'dart:io';

void main() {
  // Definimos las pensiones por categoría
  const pensiones = {
    'A': 550,
    'B': 500,
    'C': 460,
    'D': 400,
  };

  // Definimos los descuentos por promedio
  const descuentos = {
    '0-13.99': 0.0,
    '14-15.99': 0.10,
    '16-17.99': 0.12,
    '18-20': 0.15,
  };

  // Solicitar al usuario la categoría y el promedio
  print('Ingrese la categoría del estudiante (A, B, C, D):');
  String categoria = stdin.readLineSync()!.toUpperCase();
  
  print('Ingrese el promedio del estudiante:');
  double promedio = double.parse(stdin.readLineSync()!);

  // Validar categoría
  if (!pensiones.containsKey(categoria)) {
    print('Categoría inválida.');
    return;
  }

  // Determinar el porcentaje de descuento según el promedio
  double descuentoPorcentaje;
  if (promedio < 14) {
    descuentoPorcentaje = descuentos['0-13.99']!;
  } else if (promedio < 16) {
    descuentoPorcentaje = descuentos['14-15.99']!;
  } else if (promedio < 18) {
    descuentoPorcentaje = descuentos['16-17.99']!;
  } else {
    descuentoPorcentaje = descuentos['18-20']!;
  }

  // Calcular la pensión actual y la rebaja
  double pensionActual = pensiones[categoria]!.toDouble();
  double rebaja = pensionActual * descuentoPorcentaje;
  double nuevaPension = pensionActual - rebaja;

  // Mostrar resultados
  print('Pensión actual: \$${pensionActual.toStringAsFixed(2)}');
  print('Rebaja: \$${rebaja.toStringAsFixed(2)}');
  print('Nueva pensión: \$${nuevaPension.toStringAsFixed(2)}');
}
