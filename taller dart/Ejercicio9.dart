import 'dart:io';  // Para entrada/salida (stdin/stdout)
import 'dart:math'; // Para cálculos matemáticos (pi, pow)

// COMMIT 1: Define función principal (main) que inicia el programa
void main() {
  print('CALCULADORA DE ÁREAS Y PERÍMETROS');
  print('----------------------------------');
  print('1. Triángulo');
  print('2. Rectángulo');
  print('3. Círculo');
  print('----------------------------------');

  int opcion;
  do {
    // COMMIT 2: Solicita selección de figura (1-3) con validación
    stdout.write('\nSeleccione una figura (1-3): ');
    opcion = int.tryParse(stdin.readLineSync()!) ?? 0;

    // COMMIT 3: Switch para manejar cada opción del menú
    switch (opcion) {
      case 1:
        calcularTriangulo();
        break;
      case 2:
        calcularRectangulo();
        break;
      case 3:
        calcularCirculo();
        break;
      default:
        print('Opción no válida. Intente nuevamente.');
    }
  } while (opcion < 1 || opcion > 3); // Repite hasta elegir una opción válida
}

// COMMIT 4: Función para calcular área y perímetro de un triángulo
void calcularTriangulo() {
  print('\nCÁLCULO DE TRIÁNGULO');
  double base = solicitarValorPositivo('Ingrese la base del triángulo: ');
  double altura = solicitarValorPositivo('Ingrese la altura del triángulo: ');
  double lado1 = solicitarValorPositivo('Ingrese el primer lado del triángulo: ');
  double lado2 = solicitarValorPositivo('Ingrese el segundo lado del triángulo: ');
  double lado3 = solicitarValorPositivo('Ingrese el tercer lado del triángulo: ');

  // COMMIT 5: Valida que los lados formen un triángulo válido
  if (!esTrianguloValido(lado1, lado2, lado3)) {
    print('ERROR: Los lados no forman un triángulo válido.');
    return;
  }

  double area = (base * altura) / 2;
  double perimetro = lado1 + lado2 + lado3;

  mostrarResultado('Triángulo', area, perimetro);
}

// COMMIT 6: Función para calcular área y perímetro de un rectángulo
void calcularRectangulo() {
  print('\nCÁLCULO DE RECTÁNGULO');
  double base = solicitarValorPositivo('Ingrese la base del rectángulo: ');
  double altura = solicitarValorPositivo('Ingrese la altura del rectángulo: ');

  double area = base * altura;
  double perimetro = 2 * (base + altura);

  mostrarResultado('Rectángulo', area, perimetro);
}

// COMMIT 7: Función para calcular área y perímetro de un círculo
void calcularCirculo() {
  print('\nCÁLCULO DE CÍRCULO');
  double radio = solicitarValorPositivo('Ingrese el radio del círculo: ');

  double area = pi * pow(radio, 2);
  double perimetro = 2 * pi * radio;

  mostrarResultado('Círculo', area, perimetro);
}

// COMMIT 8: Función auxiliar para solicitar valores positivos (evita <= 0)
double solicitarValorPositivo(String mensaje) {
  double valor;
  do {
    stdout.write(mensaje);
    valor = double.tryParse(stdin.readLineSync()!) ?? 0;
    if (valor <= 0) {
      print('ERROR: El valor debe ser mayor que cero.');
    }
  } while (valor <= 0);
  return valor;
}

// COMMIT 9: Valida si 3 lados pueden formar un triángulo (desigualdad triangular)
bool esTrianguloValido(double a, double b, double c) {
  return a + b > c && a + c > b && b + c > a;
}

// COMMIT 10: Muestra resultados (2 decimales)
void mostrarResultado(String figura, double area, double perimetro) {
  print('\nRESULTADOS');
  print('----------------------------------');
  print('Figura: $figura');
  print('Área: ${area.toStringAsFixed(2)} unidades cuadradas');
  print('Perímetro: ${perimetro.toStringAsFixed(2)} unidades');
  print('----------------------------------');
}