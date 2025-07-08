import 'dart:io';

void main() {
  print('DESCOMPOSICIÓN DE NÚMEROS');
  print('══════════════════════════');
  
  int? numero;
  do {
    stdout.write('Ingrese un número entero: ');
    String input = stdin.readLineSync() ?? '';
    numero = int.tryParse(input);
    
    if (numero == null) {
      print('Error: Debe ingresar un número entero válido.\n');
    }
  } while (numero == null);
  
  // Tomar valor absoluto para manejar números negativos
  numero = numero.abs();
  
  // Convertir a string para procesar cada dígito
  String numeroStr = numero.toString();
  int cantidadDigitos = numeroStr.length;
  
  print('\nDescomposición del número:');
  print('══════════════════════════');
  
  // Mostrar cada dígito individualmente
  for (int i = 0; i < cantidadDigitos; i++) {
    print('Dígito ${i + 1}: ${numeroStr[i]}');
  }
  
  print('══════════════════════════');
  print('El número tiene $cantidadDigitos dígito${cantidadDigitos != 1 ? 's' : ''}.');
}
  