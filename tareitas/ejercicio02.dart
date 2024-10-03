import 'dart:io';

void main() {
  // Costos base
  const double costoMayorDe18 = 350;
  const double costoMenorOIgual18 = 200;

  // Descuentos por nivel
  const descuentos = {
    '1': 0.40,
    '2': 0.30,
    '3': 0.15,
  };

  // Solicitar datos al usuario
  print('Ingrese la edad del hombre:');
  int edad = int.parse(stdin.readLineSync()!);

  print('Ingrese el nivel del sistema de beneficio (1, 2, 3 o cualquier otro):');
  String nivel = stdin.readLineSync()!;

  // Variables para el costo y el descuento
  double costo;
  double descuento = 0.0;

  // Determinar el costo y el descuento según la edad
  if (edad > 18) {
    costo = costoMayorDe18;
    if (descuentos.containsKey(nivel)) {
      descuento = descuentos[nivel]!;
    }
  } else if (edad == 18) {
    costo = costoMenorOIgual18;
    if (descuentos.containsKey(nivel)) {
      descuento = descuentos[nivel]!;
    }
  } else {
    print('La edad debe ser 18 años o más para obtener la libreta militar.');
    return;
  }

  // Calcular el monto del descuento y el costo final
  double montoDescuento = costo * descuento;
  double costoFinal = costo - montoDescuento;

  // Mostrar resultados
  print('Descuento aplicado: \$${montoDescuento.toStringAsFixed(2)}');
  print('Valor final a pagar: \$${costoFinal.toStringAsFixed(2)}');
}
