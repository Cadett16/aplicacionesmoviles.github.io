

// CALCULO DE POTENCIAS USANDO MULTPLICACION REPETIDA

import 'dart:io';

void main() {
  // Solicitar la base al usuario
  print('Ingrese la base:');
  double? base = double.tryParse(stdin.readLineSync() ?? '');

  // Solicitar el exponente al usuario
  print('Ingrese el exponente:');
  int? exponente = int.tryParse(stdin.readLineSync() ?? '');

  // Verificar que ambos valores sean válidos
  if (base == null || exponente == null) {
    print('Por favor, ingrese valores válidos.');
    return;
  }

  double resultado = 1;

  // Calcular la potencia usando un bucle for
  for (int i = 0; i < exponente.abs(); i++) {
    resultado *= base; // Multiplicación repetida
  }

  // Si el exponente es negativo, calcular el inverso
  if (exponente < 0) {
    resultado = 1 / resultado;
  }

  // Mostrar el resultado
  print('$base elevado a la $exponente es: $resultado');
}
