
// SUMA DE MATRICES NxN


import 'dart:io';

void main() {
  // Solicitar el tamaño de la matriz
  print('Ingrese el tamaño de la matriz (N):');
  int? n = int.tryParse(stdin.readLineSync() ?? '');

  // Verificar que N sea un número válido
  if (n == null || n <= 0) {
    print('Por favor, ingrese un número entero positivo.');
    return;
  }

  // Inicializar las matrices
  List<List<int>> matriz1 = List.generate(n, (_) => List.filled(n, 0));
  List<List<int>> matriz2 = List.generate(n, (_) => List.filled(n, 0));
  List<List<int>> suma = List.generate(n, (_) => List.filled(n, 0));

  // Solicitar los elementos de la primera matriz
  print('Ingrese los elementos de la primera matriz:');
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      print('Elemento [${i + 1}][${j + 1}]:');
      matriz1[i][j] = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    }
  }

  // Solicitar los elementos de la segunda matriz
  print('Ingrese los elementos de la segunda matriz:');
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      print('Elemento [${i + 1}][${j + 1}]:');
      matriz2[i][j] = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    }
  }

  // Calcular la suma de las dos matrices
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      suma[i][j] = matriz1[i][j] + matriz2[i][j];
    }
  }

  // Mostrar el resultado
  print('La suma de las dos matrices es:');
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      stdout.write('${suma[i][j]} ');
    }
    print(''); // Nueva línea después de cada fila
  }
}
