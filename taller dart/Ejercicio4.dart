import 'dart:io';

void main() {
  // Solicitar el primer número
  print('Ingrese el número A:');
  double A = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  // Solicitar el segundo número
  print('Ingrese el número B:');
  double B = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  // Calcular la suma
  double resultado = A - B;


  print('\nLa resta del número ${A.toStringAsFixed(A.truncateToDouble() == A ? 0 : 2)} '
      'con el número ${B.toStringAsFixed(B.truncateToDouble() == B ? 0 : 2)} '
      'es: ${resultado.toStringAsFixed(resultado.truncateToDouble() == resultado ? 0 : 2)}');
}