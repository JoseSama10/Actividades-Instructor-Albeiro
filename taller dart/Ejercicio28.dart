import 'dart:io';

void main() {
  while (true) {
    print('=== MENÚ DE SUMAS ===');
    print('1. Sumar sin parámetros y sin retorno de valor');
    print('2. Sumar con parámetros y sin retorno de valor');
    print('3. Sumar sin parámetros y con retorno de valor');
    print('4. Sumar con parámetros y con retorno de valor');
    print('5. Salir');
    print('Seleccione una opción:');

    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        sumarSinParametrosSinRetorno();
        break;
      case '2':
        print('Ingrese dos números para sumar:');
        double num1 = double.parse(stdin.readLineSync()!);
        double num2 = double.parse(stdin.readLineSync()!);
        sumarConParametrosSinRetorno(num1, num2);
        break;
      case '3':
        double resultado = sumarSinParametrosConRetorno();
        print('La suma es: $resultado');
        break;
      case '4':
        print('Ingrese dos números para sumar:');
        double num1 = double.parse(stdin.readLineSync()!);
        double num2 = double.parse(stdin.readLineSync()!);
        double resultado = sumarConParametrosConRetorno(num1, num2);
        print('La suma es: $resultado');
        break;
      case '5':
        print('Saliendo del programa...');
        return;
      default:
        print('Opción no válida. Intente nuevamente.');
    }
  }
}

// Opción 1: Sumar sin parámetros y sin retorno de valor
void sumarSinParametrosSinRetorno() {
  double num1 = 5; // Ejemplo de números fijos
  double num2 = 10;
  double suma = num1 + num2;
  print('La suma de $num1 y $num2 es: $suma');
}

// Opción 2: Sumar con parámetros y sin retorno de valor
void sumarConParametrosSinRetorno(double a, double b) {
  double suma = a + b;
  print('La suma de $a y $b es: $suma');
}

// Opción 3: Sumar sin parámetros y con retorno de valor
double sumarSinParametrosConRetorno() {
  double num1 = 3; // Ejemplo de números fijos
  double num2 = 7;
  return num1 + num2;
}

// Opción 4: Sumar con parámetros y con retorno de valor
double sumarConParametrosConRetorno(double a, double b) {
  return a + b;