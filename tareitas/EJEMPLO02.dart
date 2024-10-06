
// NUMEROS FIBONACCI HASTA N TERMINOS

import 'dart:io';

void main() {
  // Solicitar al usuario el número de términos
  print('Ingrese el número de términos de la secuencia de Fibonacci:');
  int? n = int.tryParse(stdin.readLineSync() ?? '');

  // Verificar que el número ingresado sea válido
  if (n == null || n <= 0) {
    print('Por favor, ingrese un número entero positivo.');
    return;
  }

  // Variables para la secuencia de Fibonacci
  int a = 0; // Primer término
  int b = 1; // Segundo término

  // Imprimir la secuencia de Fibonacci
  print('Secuencia de Fibonacci hasta $n términos:');
  for (int i = 0; i < n; i++) {
    if (i == 0) {
      print(a); // Imprimir el primer término
    } else if (i == 1) {
      print(b); // Imprimir el segundo término
    } else {
      int c = a + b; // Sumar los dos términos anteriores
      print(c); // Imprimir el término actual
      a = b; // Actualizar el primer término
      b = c; // Actualizar el segundo término
    }
  }
}
