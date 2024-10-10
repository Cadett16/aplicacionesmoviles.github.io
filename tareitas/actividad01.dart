import 'dart:io';

class Vendedor {
  double sueldoBasico = 350.75;
  double porcentajeComision = 0.05; 
  double porcentajeDescuento = 0.15; 

  double calcularComision(double importeTotal) {
    return importeTotal * porcentajeComision;
  }

  double calcularSueldoBruto(double comision) {
    return sueldoBasico + comision;
  }

  double calcularDescuento(double sueldoBruto) {
    return sueldoBruto * porcentajeDescuento;
  }

  double calcularSueldoNeto(double sueldoBruto, double descuento) {
    return sueldoBruto - descuento;
  }
}

void main() {
  
  Vendedor vendedor = Vendedor();

  
  print('Ingresa el importe total vendido en el mes:');
  double importeTotalVendido = double.parse(stdin.readLineSync()!);


  double comision = vendedor.calcularComision(importeTotalVendido);
  double sueldoBruto = vendedor.calcularSueldoBruto(comision);
  double descuento = vendedor.calcularDescuento(sueldoBruto);
  double sueldoNeto = vendedor.calcularSueldoNeto(sueldoBruto, descuento);

  
  print('\n--- Boleta de Sueldo del Vendedor ---');
  print('Sueldo Básico: \$${vendedor.sueldoBasico.toStringAsFixed(2)}');
  print('Comisión: \$${comision.toStringAsFixed(2)}');
  print('Sueldo Bruto: \$${sueldoBruto.toStringAsFixed(2)}');
  print('Descuento: \$${descuento.toStringAsFixed(2)}');
  print('Sueldo Neto: \$${sueldoNeto.toStringAsFixed(2)}');
}
