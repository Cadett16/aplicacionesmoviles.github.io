
// NUMERO PERFECTO

void main() {
  print('Números perfectos entre 1 y 10,000:');
  
  for (int numero = 1; numero <= 10000; numero++) {
    int sumaDivisores = 0;

    // Encontrar divisores propios del número
    for (int i = 1; i < numero; i++) {
      if (numero % i == 0) {
        sumaDivisores += i; // Sumar divisor
      }
    }

    // Verificar si el número es perfecto
    if (sumaDivisores == numero) {
      print(numero); // Mostrar el número perfecto
    }
  }
}
