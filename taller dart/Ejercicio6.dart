import 'dart:io';

void main() {
  print('Ingrese el primer número (dividendo):');
  double A = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  print('Ingrese el segundo número (divisor):');
  double B = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;

  if (B == 0) {
    print('\nImposible la división por 0');
  } else {
    double resultado = A / B;
    print('\nLa división del número $numeroA entre el número $numeroB es: $resultado');
  }
}