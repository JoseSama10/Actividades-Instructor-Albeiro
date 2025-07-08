import 'dart:io';

void main() {
  print('GENERADOR DE TABLAS DE MULTIPLICAR');
  print('----------------------------------');
  
  int numero = 0; // Inicializada con valor por defecto
  bool entradaValida = false;
  
  // Solicitar número con validación
  do {
    stdout.write('Ingrese un número del 1 al 10: ');
    String? input = stdin.readLineSync();
    
    if (input == null || input.isEmpty) {
      print('Error: Debe ingresar un valor.');
      continue;
    }
    
    numero = int.tryParse(input) ?? 0;
    
    if (numero >= 1 && numero <= 10) {
      entradaValida = true;
    } else {
      print('Error: El número debe estar entre 1 y 10.\n');
    }
  } while (!entradaValida);
  
  // Mostrar tabla de multiplicar
  print('\nTabla de multiplicar del $numero:');
  print('----------------------------------');
  
  for (int i = 1; i <= 10; i++) {
    int resultado = numero * i;
    print('$numero x $i = $resultado');
  }
  
  print('----------------------------------');
}