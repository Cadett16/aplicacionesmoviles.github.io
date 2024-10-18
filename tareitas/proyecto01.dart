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
    print('Código: $codigo');
    print('Nombres: $nombres');
    print('Nota 1: $nota1');
    print('Nota 2: $nota2');
    print('Promedio: ${calcularPromedio()}');
  }

  // Método para calcular el promedio
  double calcularPromedio() {
    return (nota1 + nota2) / 2;
  }
}

void main() {
  List<Estudiante> listaEstudiantes = [];
  listaEstudiantes.add(Estudiante('001', 'Juan PEREZ', 15.5, 17.8));
  listaEstudiantes.add(Estudiante('002', 'Juan GOMEZ', 15.5, 17.8));

  for (var estudiante in listaEstudiantes) {
    estudiante.mostrarInformacion();
    print('---');
  }
}
