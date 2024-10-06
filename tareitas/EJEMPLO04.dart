
// INVERSION DE UN NUMERO

import 'dart:io';

void main() {
  // Solicitar al usuario que ingrese un número entero
  print('Ingrese un número entero:');
  int? numero = int.tryParse(stdin.readLineSync() ?? '');

  // Verificar que el número ingresado sea válido
  if (numero == null) {
    print('Por favor, ingrese un número entero válido.');
    return;
  }

  // Almacenar los dígitos del número en una lista
  List<int> digitos = [];

  // Extraer los dígitos usando un bucle while
  int num = numero.abs(); // Trabajamos con el valor absoluto
  while (num > 0) {
    digitos.add(num % 10); // Agregar el último dígito a la lista
    num ~/= 10; // Eliminar el último dígito
  }

  // Invertir los dígitos
  String digitosInvertidos = digitos.join('');

  // Mostrar el resultado
  print('Los dígitos de $numero invertidos son: $digitosInvertidos');
}
