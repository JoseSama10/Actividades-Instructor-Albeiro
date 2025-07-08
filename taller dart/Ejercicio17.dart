import 'dart:io';

void main() {
  print('CALCULADORA DE FACTORIAL');
  print('------------------------');
  print('Ingrese un número entero entre 0 y 12');
  
  int numero = -1;
  bool entradaValida = false;
  
  // Validación de entrada
  do {
    stdout.write('Número: ');
    String? input = stdin.readLineSync();
    
    if (input == null || input.isEmpty) {
      print('Error: Debe ingresar un valor');
      continue;
    }
    
    numero = int.tryParse(input) ?? -1;
    
    if (numero < 0) {
      print('Error: El número debe ser positivo');
    } else if (numero > 12) {
      entradaValida = true;
      print('El factorial de $numero es infinito');
    } else {
      entradaValida = true;
    }
  } while (!entradaValida);
  
  // Cálculo del factorial solo para números <= 12
  if (numero <= 12) {
    int factorial = 1;
    
    // Caso especial para 0
    if (numero == 0) {
      print('0! = 1');
    } else {
      // Calcular factorial
      String proceso = '';
      for (int i = 1; i <= numero; i++) {
        factorial *= i;
        proceso += i == numero ? '$i' : '$i × ';
      }
      
      print('$numero! = $proceso = $factorial');
    }
  }
  
  print('------------------------');
}