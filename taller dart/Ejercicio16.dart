import 'dart:io';

void main() {
  print('GENERADOR DE LA SERIE FIBONACCI');
  print('-------------------------------');
  
  int cantidad = 0;
  bool entradaValida = false;
  
  // Solicitar cantidad con validación
  do {
    stdout.write('¿Cuántos números de la serie Fibonacci desea ver? (mínimo 1): ');
    String? input = stdin.readLineSync();
    
    if (input == null || input.isEmpty) {
      print('Error: Debe ingresar un valor.\n');
      continue;
    }
    
    cantidad = int.tryParse(input) ?? 0;
    
    if (cantidad >= 1) {
      entradaValida = true;
    } else {
      print('Error: Debe ingresar un número entero mayor o igual a 1.\n');
    }
  } while (!entradaValida);
  
  // Generar serie Fibonacci
  print('\nSerie Fibonacci de $cantidad términos:');
  
  if (cantidad == 1) {
    print('0');
  } else {
    int a = 0;
    int b = 1;
    String resultado = '0, 1';
    
    // Generar términos adicionales si se necesitan
    for (int i = 2; i < cantidad; i++) {
      int siguiente = a + b;
      resultado += ', $siguiente';
      a = b;
      b = siguiente;
    }
    
    print(resultado);
  }
  
  print('-------------------------------');
}