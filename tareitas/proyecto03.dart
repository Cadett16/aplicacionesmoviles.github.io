import 'dart:io';

// Clase Estudiante
class Estudiante {
  String codigo;
  String nombres;
  double nota1;
  double nota2;

  // Constructor
  Estudiante(this.codigo, this.nombres, this.nota1, this.nota2);

  // Método para mostrar la información del estudiante
  void mostrarInformacion() {
    print('\n--- Información del Estudiante ---');
    print('Código: $codigo');
    print('Nombres: $nombres');
    print('Nota 1: $nota1');
    print('Nota 2: $nota2');
    print('Promedio: ${calcularPromedio()}');
    print(calcularEstado());
  }

  // Método para calcular el promedio
  double calcularPromedio() {
    return (nota1 + nota2) / 2;
  }

  // Método para calcular el estado (aprobado o reprobado)
  String calcularEstado() {
    return calcularPromedio() >= 6 ? 'Estado: Aprobado' : 'Estado: Reprobado';
  }
}

// Método para ingresar los datos del estudiante
Estudiante ingresarDatosEstudiante() {
  print('Ingrese el codigo del estudiante:');
  String? codigo = stdin.readLineSync();

  print('Ingrese nombres del estudiante:');
  String? nombres = stdin.readLineSync();

  print('Ingrese primera nota:');
  double nota1 = double.parse(stdin.readLineSync()!);

  print('Ingrese segunda nota:');
  double nota2 = double.parse(stdin.readLineSync()!);

  return Estudiante(codigo!, nombres!, nota1, nota2);
}

void main() {
  // Llamar al método para ingresar los datos del estudiante
  Estudiante estudiante = ingresarDatosEstudiante();

  // Llamar al método para mostrar la información
  estudiante.mostrarInformacion();
}
