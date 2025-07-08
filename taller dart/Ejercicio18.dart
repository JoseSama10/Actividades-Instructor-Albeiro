import 'dart:io';

void main() {
  print('ORGANIZADOR DE NÚMEROS');
  print('----------------------------------');
  
  // Variables para los tres números
  double num1 = 0, num2 = 0, num3 = 0;
  
  // Solicitar los tres números con validación
  for (int i = 1; i <= 3; i++) {
    double? numero;
    do {
      stdout.write('Ingrese el número $i: ');
      String? input = stdin.readLineSync();
      numero = double.tryParse(input ?? '');
      
      if (numero == null) {
        print('Error: Debe ingresar un número válido.\n');
      }
    } while (numero == null);
    
    // Asignar a variables individuales
    if (i == 1) num1 = numero;
    if (i == 2) num2 = numero;
    if (i == 3) num3 = numero;
  }
  
  // Solicitar tipo de ordenamiento
  int opcion = 0;
  do {
    print('\n¿Cómo desea ordenar los números?');
    print('1. Ascendente (de menor a mayor)');
    print('2. Descendente (de mayor a menor)');
    stdout.write('Seleccione (1-2): ');
    
    String? input = stdin.readLineSync();
    opcion = int.tryParse(input ?? '') ?? 0;
    
    if (opcion != 1 && opcion != 2) {
      print('Opción inválida. Intente nuevamente.\n');
    }
  } while (opcion != 1 && opcion != 2);
  
  // Variables para almacenar resultados ordenados
  double menor = 0, medio = 0, mayor = 0;
  
  // Ordenar los números sin arreglos
  if (opcion == 1) {
    // Encontrar el menor
    if (num1 <= num2 && num1 <= num3) {
      menor = num1;
      if (num2 <= num3) {
        medio = num2;
        mayor = num3;
      } else {
        medio = num3;
        mayor = num2;
      }
    } else if (num2 <= num1 && num2 <= num3) {
      menor = num2;
      if (num1 <= num3) {
        medio = num1;
        mayor = num3;
      } else {
        medio = num3;
        mayor = num1;
      }
    } else {
      menor = num3;
      if (num1 <= num2) {
        medio = num1;
        mayor = num2;
      } else {
        medio = num2;
        mayor = num1;
      }
    }
  } else {
    // Encontrar el mayor
    if (num1 >= num2 && num1 >= num3) {
      mayor = num1;
      if (num2 >= num3) {
        medio = num2;
        menor = num3;
      } else {
        medio = num3;
        menor = num2;
      }
    } else if (num2 >= num1 && num2 >= num3) {
      mayor = num2;
      if (num1 >= num3) {
        medio = num1;
        menor = num3;
      } else {
        medio = num3;
        menor = num1;
      }
    } else {
      mayor = num3;
      if (num1 >= num2) {
        medio = num1;
        menor = num2;
      } else {
        medio = num2;
        menor = num1;
      }
    }
  }
  
  // Mostrar resultado
  print('\nNúmeros ordenados:');
  print('----------------------');
  print('$menor, $medio, $mayor');
  print('----------------------');
}