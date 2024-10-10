import 'dart:io';

class GastosFeria {
  double porcentajeAlquiler = 0.23; 
  double porcentajePublicidad = 0.07;
  double porcentajeTransporte = 0.26; 
  double porcentajeServicios = 0.12; 
  double porcentajeDecoracion = 0.21; 
  double porcentajeGastosVarios = 0.11; 

  double calcularGasto(double total, double porcentaje) {
    return total * porcentaje;
  }
}

void main() {

  GastosFeria gastos = GastosFeria();

 
  print('Ingresa el monto total a invertir:');
  double montoTotal = double.parse(stdin.readLineSync()!);


  double gastoAlquiler = gastos.calcularGasto(montoTotal, gastos.porcentajeAlquiler);
  double gastoPublicidad = gastos.calcularGasto(montoTotal, gastos.porcentajePublicidad);
  double gastoTransporte = gastos.calcularGasto(montoTotal, gastos.porcentajeTransporte);
  double gastoServicios = gastos.calcularGasto(montoTotal, gastos.porcentajeServicios);
  double gastoDecoracion = gastos.calcularGasto(montoTotal, gastos.porcentajeDecoracion);
  double gastoGastosVarios = gastos.calcularGasto(montoTotal, gastos.porcentajeGastosVarios);


  print('\n--- Desglose de Gastos en la Feria ---');
  print('Alquiler de espacio en la feria: \$${gastoAlquiler.toStringAsFixed(2)}');
  print('Publicidad: ${gastoPublicidad.toStringAsFixed(2)}');
  print('Transporte: ${gastoTransporte.toStringAsFixed(2)}');
  print('Servicios feriales: ${gastoServicios.toStringAsFixed(2)}');
  print('Decoración: ${gastoDecoracion.toStringAsFixed(2)}');
  print('Gastos varios: ${gastoGastosVarios.toStringAsFixed(2)}');
}
