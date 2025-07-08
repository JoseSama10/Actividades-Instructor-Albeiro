import 'dart:io';
import 'dart:math';

void main() {
  print('DETERMINADOR DE TIPO DE TRIÁNGULO');
  print('----------------------------------');
  print('Seleccione el método de entrada:');
  print('1. Ingresar ángulos');
  print('2. Ingresar lados');
  print('----------------------------------');

  int opcion;
  do {
    stdout.write('Opción (1-2): ');
    opcion = int.tryParse(stdin.readLineSync()!) ?? 0;
    if (opcion < 1 || opcion > 2) {
      print('Opción inválida. Intente nuevamente.');
    }
  } while (opcion < 1 || opcion > 2);

  if (opcion == 1) {
    // Método por ángulos
    double angulo1, angulo2, angulo3;
    double sumaAngulos;
    const double tolerancia = 0.0001; // Tolerancia para comparación de decimales

    do {
      print('\nINGRESO DE ÁNGULOS (en grados)');
      
      // Validar y obtener ángulo 1
      do {
        stdout.write('Ángulo 1: ');
        angulo1 = double.tryParse(stdin.readLineSync()!) ?? 0;
        if (angulo1 <= 0) {
          print('ERROR: El ángulo debe ser mayor que cero.');
        }
      } while (angulo1 <= 0);

      // Validar y obtener ángulo 2
      do {
        stdout.write('Ángulo 2: ');
        angulo2 = double.tryParse(stdin.readLineSync()!) ?? 0;
        if (angulo2 <= 0) {
          print('ERROR: El ángulo debe ser mayor que cero.');
        }
      } while (angulo2 <= 0);

      // Validar y obtener ángulo 3
      do {
        stdout.write('Ángulo 3: ');
        angulo3 = double.tryParse(stdin.readLineSync()!) ?? 0;
        if (angulo3 <= 0) {
          print('ERROR: El ángulo debe ser mayor que cero.');
        }
      } while (angulo3 <= 0);

      sumaAngulos = angulo1 + angulo2 + angulo3;
      
      if ((sumaAngulos - 180).abs() > tolerancia) {
        print('ERROR: La suma de los ángulos debe ser 180° (actual: ${sumaAngulos.toStringAsFixed(2)}°).');
        print('Vuelva a ingresar los ángulos.');
      }
    } while ((sumaAngulos - 180).abs() > tolerancia);

    // Determinar tipo por lados (basado en ángulos iguales)
    String tipoPorLados;
    if (angulo1 == 60 && angulo2 == 60 && angulo3 == 60) {
      tipoPorLados = 'Equilátero';
    } else if (angulo1 == angulo2 || angulo1 == angulo3 || angulo2 == angulo3) {
      tipoPorLados = 'Isósceles';
    } else {
      tipoPorLados = 'Escaleno';
    }

    // Determinar tipo por ángulos
    String tipoPorAngulos;
    if (angulo1 == 90 || angulo2 == 90 || angulo3 == 90) {
      tipoPorAngulos = 'Rectángulo';
    } else if (angulo1 > 90 || angulo2 > 90 || angulo3 > 90) {
      tipoPorAngulos = 'Obtusángulo';
    } else {
      tipoPorAngulos = 'Acutángulo';
    }

    // Mostrar resultados
    print('\nRESULTADOS');
    print('----------------------------------');
    print('Por lados: $tipoPorLados');
    print('Por ángulos: $tipoPorAngulos');
    print('----------------------------------');

  } else {
    // Método por lados
    double lado1, lado2, lado3;
    bool esTrianguloValido = false;

    do {
      print('\nINGRESO DE LADOS');
      
      // Validar y obtener lado 1
      do {
        stdout.write('Lado 1: ');
        lado1 = double.tryParse(stdin.readLineSync()!) ?? 0;
        if (lado1 <= 0) {
          print('ERROR: El lado debe ser mayor que cero.');
        }
      } while (lado1 <= 0);

      // Validar y obtener lado 2
      do {
        stdout.write('Lado 2: ');
        lado2 = double.tryParse(stdin.readLineSync()!) ?? 0;
        if (lado2 <= 0) {
          print('ERROR: El lado debe ser mayor que cero.');
        }
      } while (lado2 <= 0);

      // Validar y obtener lado 3
      do {
        stdout.write('Lado 3: ');
        lado3 = double.tryParse(stdin.readLineSync()!) ?? 0;
        if (lado3 <= 0) {
          print('ERROR: El lado debe ser mayor que cero.');
        }
      } while (lado3 <= 0);

      // Ordenar lados de menor a mayor
      List<double> lados = [lado1, lado2, lado3];
      lados.sort();
      final a = lados[0];
      final b = lados[1];
      final c = lados[2];

      // Validar desigualdad triangular
      if (a + b > c) {
        esTrianguloValido = true;
        
        // Determinar tipo por lados
        String tipoPorLados;
        if (a == b && b == c) {
          tipoPorLados = 'Equilátero';
        } else if (a == b || b == c || a == c) {
          tipoPorLados = 'Isósceles';
        } else {
          tipoPorLados = 'Escaleno';
        }

        // Determinar tipo por ángulos usando ley de cosenos
        String tipoPorAngulos;
        final a2 = a * a;
        final b2 = b * b;
        final c2 = c * c;
        
        if (a2 + b2 == c2) {
          tipoPorAngulos = 'Rectángulo';
        } else if (a2 + b2 > c2) {
          tipoPorAngulos = 'Acutángulo';
        } else {
          tipoPorAngulos = 'Obtusángulo';
        }

        // Mostrar resultados
        print('\nRESULTADOS');
        print('----------------------------------');
        print('Por lados: $tipoPorLados');
        print('Por ángulos: $tipoPorAngulos');
        print('----------------------------------');
        
      } else {
        print('ERROR: No cumple desigualdad triangular ($a + $b <= $c).');
        print('Vuelva a ingresar los lados.');
      }
    } while (!esTrianguloValido);
  }
}