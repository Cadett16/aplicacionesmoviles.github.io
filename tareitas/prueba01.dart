import 'dart:io';

void main() {
  List<String> categorias = [];
  List<double> promedios = [];
  List<double> pensiones = [];
  List<double> descuentos = [];
  List<double> rebajas = [];
  List<double> nuevasPensiones = [];
  
  while (true) {
    print("Ingrese la categoría del estudiante (A, B, C, D)");
    String categoria = stdin.readLineSync()!.toUpperCase();
    
    if (categoria == 'FIN') {
      break; // Termina la entrada de estudiantes
    }
    
    // Validar la categoría
    if (!['A', 'B', 'C', 'D'].contains(categoria)) {
      print("Categoría inválida. Intente de nuevo.");
      continue;
    }
    
    double promedio;
    while (true) {
      print("Ingrese el promedio ponderado del ciclo anterior (0 - 20):");
      promedio = double.parse(stdin.readLineSync()!);
      
      // Validar el promedio
      if (promedio < 0 || promedio > 20) {
        print("Promedio inválido. Intente de nuevo.");
      } else {
        break; // Salir del bucle si el promedio es válido
      }
    }
    
    // Agregar datos a las listas
    categorias.add(categoria);
    promedios.add(promedio);
    
    // Determinar la pensión inicial
    double pension;
    switch (categoria) {
      case 'A':
        pension = 550.0;
        break;
      case 'B':
        pension = 500.0;
        break;
      case 'C':
        pension = 460.0;
        break;
      case 'D':
        pension = 400.0;
        break;
      default:
        continue; // Aunque ya validamos, esto es solo para seguridad
    }
    
    pensiones.add(pension);
    
    // Calcular el descuento
    double descuento;
    if (promedio >= 18.0) {
      descuento = 15.0;
    } else if (promedio >= 16.0) {
      descuento = 12.0;
    } else if (promedio >= 14.0) {
      descuento = 10.0;
    } else {
      descuento = 0.0;
    }
    
    descuentos.add(descuento);
    
    // Calcular la rebaja y la nueva pensión
    double rebaja = (descuento / 100) * pension;
    rebajas.add(rebaja);
    
    double nuevaPension = pension - rebaja;
    nuevasPensiones.add(nuevaPension);
  }
  
  // Mostrar resultados
  print("\nResultados:");
  for (int i = 0; i < categorias.length; i++) {
    print("Estudiante ${i + 1}:");
    print("  Categoría: ${categorias[i]}");
    print("  Promedio: ${promedios[i].toStringAsFixed(2)}");
    print("  Pensión original: S/. ${pensiones[i].toStringAsFixed(2)}");
    print("  Descuento aplicado: ${descuentos[i].toStringAsFixed(2)}%");
    print("  Rebaja: S/. ${rebajas[i].toStringAsFixed(2)}");
    print("  Nueva pensión: S/. ${nuevasPensiones[i].toStringAsFixed(2)}");
    print(""); // Línea en blanco entre estudiantes
  }
}
