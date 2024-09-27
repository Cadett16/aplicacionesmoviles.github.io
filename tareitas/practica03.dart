import 'dart:io';

void main() {
  // Solicitar el monto total de dinero a invertir
  stdout.write("Ingrese el monto total de dinero a invertir: ");
  double total = double.parse(stdin.readLineSync()!);

  // Calcular los gastos por rubro
  double alquiler = total * 0.23;
  double publicidad = total * 0.07;
  double transporte = total * 0.26;
  double serviciosFeriales = total * 0.12;
  double decoracion = total * 0.21;
  double gastosVarios = total * 0.11;

  // Mostrar resultados
  print("Distribución del dinero en los rubros:");
  print("Alquiler de espacio en la feria: \$${alquiler.toStringAsFixed(2)}");
  print("Publicidad: \$${publicidad.toStringAsFixed(2)}");
  print("Transporte: \$${transporte.toStringAsFixed(2)}");
  print("Servicios feriales: \$${serviciosFeriales.toStringAsFixed(2)}");
  print("Decoración: \$${decoracion.toStringAsFixed(2)}");
  print("Gastos varios: \$${gastosVarios.toStringAsFixed(2)}");
}
