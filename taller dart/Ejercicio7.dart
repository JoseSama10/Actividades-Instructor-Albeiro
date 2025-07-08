import 'dart:io';

void main() {
  // Mostrar menú
  print('''
  == Menú de Colores ==
  1. Amarillo
  2. Azul
  3. Rojo
  ''');

  // Solicitar las dos selecciones
  print('Ingrese el primer número (1-3):');
  int opcion1 = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  print('Ingrese el segundo número (1-3):');
  int opcion2 = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  // Validar las entradas
  if (opcion1 < 1 || opcion1 > 3 || opcion2 < 1 || opcion2 > 3) {
    print('Error: Por favor ingrese solo números entre 1 y 3');
    return;
  }

  // Determinar combinación
  String colorResultante;
  if (opcion1 == 1 && opcion2 == 1) {
    colorResultante = 'Amarillo intenso';
  } else if (opcion1 == 2 && opcion2 == 2) {
    colorResultante = 'Azul marino';
  } else if (opcion1 == 3 && opcion2 == 3) {
    colorResultante = 'Rojo oscuro';
  } else if ((opcion1 == 1 && opcion2 == 2) || (opcion1 == 2 && opcion2 == 1)) {
    colorResultante = 'Verde';
  } else if ((opcion1 == 1 && opcion2 == 3) || (opcion1 == 3 && opcion2 == 1)) {
    colorResultante = 'Naranja';
  } else if ((opcion1 == 2 && opcion2 == 3) || (opcion1 == 3 && opcion2 == 2)) {
    colorResultante = 'Morado';
  } else {
    colorResultante = 'Transparente';
  }

  // Mostrar resultado
  print('\nSu combinación es: $colorResultante');
}