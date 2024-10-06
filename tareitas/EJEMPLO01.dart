
// LA SUMATORIA DE NUMEROS PRIMOS

import 'dart:io';

// Función para verificar si un número es primo
bool esPrimo(int numero) {
  if (numero <= 1) return false; // Los números menores o iguales a 1 no son primos
  for (int i = 2; i <= numero ~/ 2; i++) {
    if (numero % i == 0) return false; // Si es divisible por cualquier número, no es primo
  }
  return true; // Es primo
}

void main() {
  // Solicitar los números al usuario
  print('Ingrese el primer número:');
  int? numero1 = int.tryParse(stdin.readLineSync() ?? '');
  
  print('Ingrese el segundo número:');
  int? numero2 = int.tryParse(stdin.readLineSync() ?? '');

  // Verificar que ambos números sean válidos
  if (numero1 == null || numero2 == null) {
    print('Por favor, ingrese números válidos.');
    return;
  }

  // Asegurarse de que numero1 sea menor que numero2
  if (numero1 > numero2) {
    int temp = numero1;
    numero1 = numero2;
    numero2 = temp;
  }

  int sumatoria = 0;

  // Recorrer el rango entre numero1 y numero2
  for (int i = numero1; i <= numero2; i++) {
    if (esPrimo(i)) {
      sumatoria += i; // Sumar si es primo
      print('$i es primo.');
    } else {
      print('$i no es primo.');
    }
  }

  // Mostrar el resultado
  print('La sumatoria de los números primos entre $numero1 y $numero2 es: $sumatoria');
}
