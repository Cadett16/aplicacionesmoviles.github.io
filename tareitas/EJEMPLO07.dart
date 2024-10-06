
// MATRIZ DE ESPIRAL

import 'dart:io';

void main() {
  // Solicitar el tamaño de la matriz al usuario
  print('Ingrese el tamaño de la matriz cuadrada (N):');
  int? n = int.tryParse(stdin.readLineSync() ?? '');

  // Verificar que N sea válido
  if (n == null || n <= 0) {
    print('Por favor, ingrese un número entero positivo.');
    return;
  }

  // Crear la matriz cuadrada
  List<List<int>> matriz = List.generate(n, (_) => List.filled(n, 0));
  int valor = 1;

  // Definir los límites de las filas y columnas
  int inicioFila = 0, finFila = n - 1;
  int inicioColumna = 0, finColumna = n - 1;

  while (inicioFila <= finFila && inicioColumna <= finColumna) {
    // Recorrer de izquierda a derecha
    for (int i = inicioColumna; i <= finColumna; i++) {
      matriz[inicioFila][i] = valor++;
    }
    inicioFila++;

    // Recorrer de arriba a abajo
    for (int i = inicioFila; i <= finFila; i++) {
      matriz[i][finColumna] = valor++;
    }
    finColumna--;

    // Recorrer de derecha a izquierda (si aún hay filas)
    if (inicioFila <= finFila) {
      for (int i = finColumna; i >= inicioColumna; i--) {
        matriz[finFila][i] = valor++;
      }
      finFila--;
    }

    // Recorrer de abajo hacia arriba (si aún hay columnas)
    if (inicioColumna <= finColumna) {
      for (int i = finFila; i >= inicioFila; i--) {
        matriz[i][inicioColumna] = valor++;
      }
      inicioColumna++;
    }
  }

  // Imprimir la matriz en forma espiral
  print('Matriz en forma espiral:');
  for (var fila in matriz) {
    print(fila);
  }
}
