
// VERIFICACION DE UN NUMERO ARMSTRONG

import 'dart:io';
import 'dart:math';

void main() {
  // Solicitar un número al usuario
  print('Ingrese un número entero:');
  int? numero = int.tryParse(stdin.readLineSync() ?? '');

  // Verificar que el número sea válido
  if (numero == null || numero < 0) {
    print('Por favor, ingrese un número entero positivo.');
    return;
  }

  // Convertir el número a cadena para contar los dígitos
  String numeroStr = numero.toString();
  int n = numeroStr.length; // Cantidad de dígitos
  int suma = 0;

  // Calcular la suma de los dígitos elevados a la potencia n
  for (int i = 0; i < n; i++) {
    int digito = int.parse(numeroStr[i]);
    suma += pow(digito, n).toInt(); // Elevar a la potencia n y sumar
  }

  // Verificar si el número es un número de Armstrong
  if (suma == numero) {
    print('$numero es un número de Armstrong.');
  } else {
    print('$numero no es un número de Armstrong.');
  }
}
