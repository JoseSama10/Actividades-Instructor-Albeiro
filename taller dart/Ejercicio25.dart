
import 'dart:io';

void main() {
  // Solicitar al usuario el tamaño del vector
  print('Ingrese el número de posiciones del vector:');
  int x = int.parse(stdin.readLineSync()!);

  // Inicializar la lista
  List<double> vector = [];

  // Ciclo para llenar el vector
  for (int i = 0; i < x; i++) {
    print('Ingrese el valor para la posición ${i + 1}:');
    double valor = double.parse(stdin.readLineSync()!);
    vector.add(valor);
  }

  // Solicitar el orden de clasificación
  print('¿Desea ordenar el vector en orden ascendente (A) o descendente (D)?');
  String orden = stdin.readLineSync()!.toUpperCase();

  // Ordenar la lista según la elección del usuario
  if (orden == 'A') {
    vector.sort();  // Orden ascendente
    print('Vector ordenado ascendente: $vector');
  } else if (orden == 'D') {
    vector.sort((a, b) => b.compareTo(a));  // Orden descendente
    print('Vector ordenado descendente: $vector');
  } else {
    print('Opción no válida. El vector no será ordenado: $vector');
  }
}
