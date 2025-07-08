
import 'dart:io';

void main() {
  print('GESTIÓN DE VECTOR');
  print('═════════════════');
  
  // Crear vector de 10 posiciones
  List<int> vector = List.filled(10, 0);
  
  // Llenar el vector usando un ciclo for
  print('\nIngrese 10 valores enteros:');
  for (int i = 0; i < 10; i++) {
    int? valor;
    do {
      stdout.write('Posición ${i + 1}: ');
      String input = stdin.readLineSync() ?? '';
      valor = int.tryParse(input);
      
      if (valor == null) {
        print('Error: Debe ingresar un número entero válido.');
      }
    } while (valor == null);
    
    vector[i] = valor;
  }
  
  // Mostrar el vector con otro ciclo
  print('\nContenido del vector:');
  print('════════════════════');
  print('Índice | Posición | Valor');
  print('───────┼──────────┼───────');
  
  for (int i = 0; i < 10; i++) {
    // Formatear la salida para alinear columnas
    String indice = i.toString().padLeft(6);
    String posicion = (i + 1).toString().padLeft(8);
    String valor = vector[i].toString().padLeft(6);
    
    print('$indice |$posicion |$valor');
  }
  
  print('════════════════════');
}
