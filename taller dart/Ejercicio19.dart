import 'dart:io';
import 'dart:math';

void main() {
  print('GENERADOR DE NÚMEROS PARA BALOTO');
  print('═══════════════════════════════');
  print('Presione Enter para generar sus números de la suerte...');
  
  // Esperar acción del usuario
  stdin.readLineSync();
  
  final random = Random();
  int n1 = 0, n2 = 0, n3 = 0, n4 = 0, n5 = 0, n6 = 0;
  
  // Generar primer número
  n1 = random.nextInt(45) + 1;
  
  // Generar segundo número único
  do {
    n2 = random.nextInt(45) + 1;
  } while (n2 == n1);
  
  // Generar tercer número único
  do {
    n3 = random.nextInt(45) + 1;
  } while (n3 == n1 || n3 == n2);
  
  // Generar cuarto número único
  do {
    n4 = random.nextInt(45) + 1;
  } while (n4 == n1 || n4 == n2 || n4 == n3);
  
  // Generar quinto número único
  do {
    n5 = random.nextInt(45) + 1;
  } while (n5 == n1 || n5 == n2 || n5 == n3 || n5 == n4);
  
  // Generar sexto número único
  do {
    n6 = random.nextInt(45) + 1;
  } while (n6 == n1 || n6 == n2 || n6 == n3 || n6 == n4 || n6 == n5);
  
  // Ordenar los números usando el método de la burbuja optimizado
  bool ordenado;
  do {
    ordenado = true;
    
    if (n1 > n2) { int t = n1; n1 = n2; n2 = t; ordenado = false; }
    if (n2 > n3) { int t = n2; n2 = n3; n3 = t; ordenado = false; }
    if (n3 > n4) { int t = n3; n3 = n4; n4 = t; ordenado = false; }
    if (n4 > n5) { int t = n4; n4 = n5; n5 = t; ordenado = false; }
    if (n5 > n6) { int t = n5; n5 = n6; n6 = t; ordenado = false; }
  } while (!ordenado);
  
  // Mostrar resultados con formato de dos dígitos
  print('\n═══════════════════════════════');
  print('¡TUS NÚMEROS DE LA SUERTE!');
  print('═══════════════════════════════');
  print('┌────┬────┬────┬────┬────┬────┐');
  print('│ ${n1.toString().padLeft(2, '0')} │ ${n2.toString().padLeft(2, '0')} │ ${n3.toString().padLeft(2, '0')} │ ${n4.toString().padLeft(2, '0')} │ ${n5.toString().padLeft(2, '0')} │ ${n6.toString().padLeft(2, '0')} │');
  print('└────┴────┴────┴────┴────┴────┘');
  print('═══════════════════════════════');

}