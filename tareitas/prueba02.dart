import 'dart:io';

class Empleado {
  int minutosTardanza;
  int observaciones;

  Empleado(this.minutosTardanza, this.observaciones);
}

void main() {
  List<Empleado> empleados = [];
  
  while (true) {
    print("Ingrese los minutos de tardanza del empleado (0 a n) o 'FIN' para terminar:");
    String? input = stdin.readLineSync();
    
    if (input?.toUpperCase() == 'FIN') {
      break; // Termina el bucle si se ingresa 'FIN'
    }

    int minutosTardanza = int.parse(input!);

    print("Ingrese la cantidad de observaciones del empleado (0 a n):");
    int observaciones = int.parse(stdin.readLineSync()!);

    // Agrega el empleado a la lista
    empleados.add(Empleado(minutosTardanza, observaciones));
  }

  // Mostrar los resultados de cada empleado
  for (int i = 0; i < empleados.length; i++) {
    Empleado empleado = empleados[i];
    int puntajePuntualidad = calcularPuntajePuntualidad(empleado.minutosTardanza);
    int puntajeRendimiento = calcularPuntajeRendimiento(empleado.observaciones);
    int puntajeTotal = puntajePuntualidad + puntajeRendimiento;
    double bonificacion = calcularBonificacion(puntajeTotal);

    print("\nEmpleado ${i + 1}:");
    print("Puntaje por puntualidad: $puntajePuntualidad");
    print("Puntaje por rendimiento: $puntajeRendimiento");
    print("Puntaje total: $puntajeTotal");
    print("Bonificación anual: S/. ${bonificacion.toStringAsFixed(2)}");
  }
}

int calcularPuntajePuntualidad(int minutosTardanza) {
  if (minutosTardanza == 0) {
    return 10;
  } else if (minutosTardanza >= 1 && minutosTardanza <= 2) {
    return 8;
  } else if (minutosTardanza >= 3 && minutosTardanza <= 5) {
    return 6;
  } else if (minutosTardanza >= 6 && minutosTardanza <= 9) {
    return 4;
  } else {
    return 0;
  }
}

int calcularPuntajeRendimiento(int observaciones) {
  if (observaciones == 0) {
    return 10;
  } else if (observaciones == 1) {
    return 8;
  } else if (observaciones == 2) {
    return 5;
  } else if (observaciones == 3) {
    return 1;
  } else {
    return 0;
  }
}

double calcularBonificacion(int puntajeTotal) {
  if (puntajeTotal < 11) {
    return puntajeTotal * 2.5;
  } else if (puntajeTotal >= 11 && puntajeTotal <= 13) {
    return puntajeTotal * 5.0;
  } else if (puntajeTotal >= 14 && puntajeTotal <= 16) {
    return puntajeTotal * 7.5;
  } else if (puntajeTotal >= 17 && puntajeTotal <= 19) {
    return puntajeTotal * 10.0;
  } else {
    return puntajeTotal * 12.5;
  }
}

