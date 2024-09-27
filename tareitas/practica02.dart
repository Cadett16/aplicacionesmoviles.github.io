import 'dart:io';

void main() {

  stdout.write("Ingrese la cantidad total de dinero a repartir: ");
  double total = double.parse(stdin.readLineSync()!);

  double josue = total * 0.27;
  double tamar = josue * 0.85;
  double daniel = total * 0.25;
  double caleb = (josue + daniel) * 0.23;

  double david = total - (josue + tamar + daniel + caleb);

  print("Distribución del dinero:");
  print("Tamar: \$${tamar.toStringAsFixed(2)}");
  print("Josué: \$${josue.toStringAsFixed(2)}");
  print("Caleb: \$${caleb.toStringAsFixed(2)}");
  print("Daniel: \$${daniel.toStringAsFixed(2)}");
  print("David: \$${david.toStringAsFixed(2)}");
}