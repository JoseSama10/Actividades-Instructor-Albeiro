
import 'dart:io';
import 'dart:math';

void main() {
  print('CALCULADORA DE CILINDRO CON TAPA');
  print('----------------------------------');
  print('calcula:');
  print('1. Área del material necesario (superficie total)');
  print('2. Perímetro de la base');
  print('3. Volumen del cilindro');
  print('----------------------------------');

  double? radio;
  double? altura;

  // Solicitar radio con validación
  do {
    stdout.write('Ingrese el radio del cilindro (en unidades): ');
    String? inputRadio = stdin.readLineSync();
    radio = double.tryParse(inputRadio!);
    
    if (radio == null || radio <= 0) {
      print('ERROR: Debe ingresar un número válido mayor que cero.');
    }
  } while (radio == null || radio <= 0);

  // Solicitar altura con validación
  do {
    stdout.write('Ingrese la altura del cilindro (en unidades): ');
    String? inputAltura = stdin.readLineSync();
    altura = double.tryParse(inputAltura!);
    
    if (altura == null || altura <= 0) {
      print('ERROR: Debe ingresar un número válido mayor que cero.');
    }
  } while (altura == null || altura <= 0);

  // Cálculos directos sin funciones
  const double pi = 3.141592653589793;
  double piPow = pow(radio, 2) as double;
  
  // Calcular métricas
  double areaLateral = 2 * pi * radio! * altura!;     // 2πrh
  double areaTapas = 2 * pi * piPow;                  // 2πr²
  double areaTotal = areaLateral + areaTapas;         // Área total de material
  double perimetroBase = 2 * pi * radio;              // 2πr (perímetro del círculo)
  double volumen = pi * piPow * altura;               // πr²h (volumen)

  // Mostrar resultados directamente
  print('\nRESULTADOS PARA EL CILINDRO');
  print('----------------------------------');
  print('Parámetros:');
  print(' - Radio: ${radio.toStringAsFixed(2)} unidades');
  print(' - Altura: ${altura.toStringAsFixed(2)} unidades');
  print('----------------------------------');
  print('Área total del material: ${areaTotal.toStringAsFixed(2)} unidades cuadradas');
  print('Perímetro de la base: ${perimetroBase.toStringAsFixed(2)} unidades lineales');
  print('Volumen: ${volumen.toStringAsFixed(2)} unidades cúbicas');
  print('----------------------------------');
}
