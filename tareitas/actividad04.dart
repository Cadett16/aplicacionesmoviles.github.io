import 'dart:io';

class Empleado {
  double tarifaHoraria(String categoria) {
    if (categoria == 'A') {
      return 45.0;
    } else if (categoria == 'B') {
      return 37.5;
    } else {
      throw Exception('Categoría no válida');
    }
  }

  double calcularSueldoBasico(double horasTrabajadas, String categoria) {
    return horasTrabajadas * tarifaHoraria(categoria);
  }

  double calcularBonificacionPorHijos(int numeroHijos) {
    if (numeroHijos <= 3) {
      return numeroHijos * 40.5;
    } else {
      return (3 * 40.5) + ((numeroHijos - 3) * 35.0);
    }
  }

  double calcularSueldoBruto(double sueldoBasico, double bonificacion) {
    return sueldoBasico + bonificacion;
  }

  double calcularDescuento(double sueldoBruto) {
    if (sueldoBruto >= 3500) {
      return sueldoBruto * 0.135; 
    } else {
      return sueldoBruto * 0.10;
    }
  }

  double calcularSueldoNeto(double sueldoBruto, double descuento) {
    return sueldoBruto - descuento;
  }
}

void main() {
  
  Empleado empleado = Empleado();

 
  print('Ingresa la categoría del empleado (A/B):');
  String categoria = stdin.readLineSync()!.toUpperCase();

  print('Ingresa la cantidad de horas trabajadas:');
  double horasTrabajadas = double.parse(stdin.readLineSync()!);

  print('Ingresa el número de hijos:');
  int numeroHijos = int.parse(stdin.readLineSync()!);


  double sueldoBasico = empleado.calcularSueldoBasico(horasTrabajadas, categoria);
  double bonificacion = empleado.calcularBonificacionPorHijos(numeroHijos);
  double sueldoBruto = empleado.calcularSueldoBruto(sueldoBasico, bonificacion);
  double descuento = empleado.calcularDescuento(sueldoBruto);
  double sueldoNeto = empleado.calcularSueldoNeto(sueldoBruto, descuento);


  print('\n--- Detalles del Sueldo del Empleado ---');
  print('Sueldo Básico: \$${sueldoBasico.toStringAsFixed(2)}');
  print('Bonificación por hijos: \$${bonificacion.toStringAsFixed(2)}');
  print('Sueldo Bruto: \$${sueldoBruto.toStringAsFixed(2)}');
  print('Descuento: \$${descuento.toStringAsFixed(2)}');
  print('Sueldo Neto: \$${sueldoNeto.toStringAsFixed(2)}');
}
