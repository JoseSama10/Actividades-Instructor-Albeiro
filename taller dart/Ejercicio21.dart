import 'dart:io';

void main() {
  print('GENERADOR DE SERIES PARES/IMPARES');
  print('════════════════════════════════');
  
  // Solicitar los dos números
  int? num1, num2;
  do {
    stdout.write('Ingrese el primer número entero: ');
    String input = stdin.readLineSync() ?? '';
    num1 = int.tryParse(input);
    
    if (num1 == null) {
      print('Error: Debe ingresar un número entero válido.\n');
    }
  } while (num1 == null);
  
  do {
    stdout.write('Ingrese el segundo número entero: ');
    String input = stdin.readLineSync() ?? '';
    num2 = int.tryParse(input);
    
    if (num2 == null) {
      print('Error: Debe ingresar un número entero válido.\n');
    }
  } while (num2 == null);
  
  // Determinar menor y mayor
  int menor = num1 < num2 ? num1 : num2;
  int mayor = num1 > num2 ? num1 : num2;
  
  // Solicitar tipo de serie
  String? tipoSerie;
  do {
    print('\n¿Qué tipo de serie desea generar?');
    stdout.write('(P) Par o (I) Impar: ');
    tipoSerie = stdin.readLineSync()?.toLowerCase();
    
    if (tipoSerie != 'p' && tipoSerie != 'i') {
      print('Error: Opción inválida. Ingrese "P" o "I".\n');
    }
  } while (tipoSerie != 'p' && tipoSerie != 'i');
  
  // Generar y mostrar la serie
  print('\nSerie ${tipoSerie == 'p' ? 'PAR' : 'IMPAR'} de $menor a $mayor:');
  print('════════════════════════════════');
  
  for (int i = menor; i <= mayor; i++) {
    if ((tipoSerie == 'p' && i % 2 == 0) || 
        (tipoSerie == 'i' && i % 2 != 0)) {
      print(i);
    }
  }
  
  print('════════════════════════════════');
}