import 'dart:io';
import 'dart:math';

void main() {
  while (true) {
    print('''
=== MENÚ DE OPERACIONES MATEMÁTICAS ===
1. Suma (a + b)
2. Resta (a - b)
3. Multiplicación (a * b)
4. División (a / b)
5. Módulo (a % b)
6. Cuadrado (a²)
7. Raíz cuadrada (√a)
8. Potencia (a^b)
9. Porcentaje (a% de b)
10. Número aleatorio (entre a y b)
0. Salir
''');

    // Solicitar selección de operación
    print('Seleccione una operación (0-10):');
    int opcion = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    // Salir si el usuario elige 0
    if (opcion == 0) {
      print('Saliendo del programa...');
      break;
    }

    double a = 0, b = 0;
    
    // Solicitar números según la operación seleccionada
    if (opcion >= 1 && opcion <= 10) {
      // No necesita b para cuadrado y raíz cuadrada
      if (opcion != 6 && opcion != 7) {
        print('Ingrese el primer número (a):');
        a = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
      }

      // Solo necesita b para operaciones que usan dos números
      if (opcion != 6 && opcion != 7 && opcion != 9) {
        print('Ingrese el segundo número (b):');
        b = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
      } else if (opcion == 9) {
        // Caso especial para porcentaje
        print('Ingrese el porcentaje que desea calcular:');
        b = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
      }
    }

    // Realizar operación seleccionada
    switch (opcion) {
      case 1: // Suma
        print('Resultado: ${a + b}');
        break;
      case 2: // Resta
        print('Resultado: ${a - b}');
        break;
      case 3: // Multiplicación
        print('Resultado: ${a * b}');
        break;
      case 4: // División
        print(b != 0 
            ? 'Resultado: ${a / b}' 
            : 'Error: División por cero');
        break;
      case 5: // Módulo (residuo de división)
        print('Resultado: ${a % b}');
        break;
      case 6: // Cuadrado
        print('Ingrese el número para calcular su cuadrado:');
        a = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        print('Resultado: ${a * a}');
        break;
      case 7: // Raíz cuadrada
        print('Ingrese el número para calcular su raíz cuadrada:');
        a = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        print(a >= 0 
            ? 'Resultado: ${sqrt(a)}' 
            : 'Error: Raíz de número negativo');
        break;
      case 8: // Potencia (a elevado a b)
        print('Resultado: ${pow(a, b)}');
        break;
      case 9: // Porcentaje (a% de b)
        print('Resultado: ${(a * b) / 100}');
        break;
      case 10: // Número aleatorio en rango [a, b]
        print('Ingrese el límite inferior:');
        a = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        print('Ingrese el límite superior:');
        b = double.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        print('Número aleatorio: ${a + Random().nextDouble() * (b - a)}');
        break;
      default:
        print('Opción inválida. Intente nuevamente.');
    }

    // Pausa antes de limpiar pantalla
    print('\nPresione Enter para continuar...');
    stdin.readLineSync();
    print('\x1B[2J\x1B[0;0H'); // Comando para limpiar pantalla en terminal
  }
}