
// FACTORIAL DE NUMEROS GRANDES

import 'dart:io';

void main() {
  // Solicitar al usuario el número del cual calcular el factorial
  print('Ingrese un número para calcular su factorial:');
  int? numero = int.tryParse(stdin.readLineSync() ?? '');

  // Verificar que el número ingresado sea válido
  if (numero == null || numero < 0) {
    print('Por favor, ingrese un número entero no negativo.');
    return;
  }

  // Calcular el factorial usando BigInt
  BigInt factorial = BigInt.one; // Inicializar con 1 (factorial de 0)

  // Usar un bucle for para calcular el factorial
  for (int i = 1; i <= numero; i++) {
    factorial *= BigInt.from(i); // Multiplicar el valor actual del factorial por i
  }

  // Mostrar el resultado
  print('El factorial de $numero es: $factorial');
}
