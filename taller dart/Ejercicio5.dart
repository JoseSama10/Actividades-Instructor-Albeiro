import 'dart:io';

void main() {
  print('Ingrese el primer número (A):');
  double numeroA = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  print('Ingrese el segundo número (B):');
  double numeroB = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  double resultado = numeroA * numeroB;

  print('\nEl producto del número $numeroA con el número $numeroB es: $resultado');
}