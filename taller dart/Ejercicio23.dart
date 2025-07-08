import 'dart:io';

void main() {
  print('REGISTRO DE COMPAÑEROS');
  print('══════════════════════');
  
  // Vector con las categorías de datos
  List<String> encabezados = ['Nombre', 'Apellido', 'Edad', 'Estado', 'Teléfono'];
  
  // Matriz para almacenar los datos de 4 compañeros
  List<List<String>> companeros = List.generate(4, (i) => List.filled(5, ''));
  
  // Llenar la matriz con datos
  for (int i = 0; i < 4; i++) {
    print('\nDatos del compañero ${i + 1}:');
    print('──────────────────────────');
    
    for (int j = 0; j < 5; j++) {
      String? dato;
      do {
        stdout.write('${encabezados[j]}: ');
        dato = stdin.readLineSync();
        
        if (dato == null || dato.isEmpty) {
          print('Este campo es obligatorio. Intente nuevamente.');
        }
      } while (dato == null || dato.isEmpty);
      
      companeros[i][j] = dato; // Línea corregida
    }
  }
  
  // Mostrar los datos en forma de tabla
  print('\nREGISTRO COMPLETO');
  print('══════════════════════════════════════════════════════════════════════════════════');
  
  // Imprimir encabezados
  print('│ ${'No.'.padRight(3)} │ ${encabezados[0].padRight(15)} │ ${encabezados[1].padRight(15)} │ ${encabezados[2].padRight(5)} │ ${encabezados[3].padRight(10)} │ ${encabezados[4].padRight(10)} │');
  print('├─────┼─────────────────┼─────────────────┼───────┼────────────┼────────────┤');
  
  // Imprimir datos de los compañeros
  for (int i = 0; i < 4; i++) {
    String fila = '│ ${(i + 1).toString().padRight(3)} │ ';
    fila += '${companeros[i][0].padRight(15)} │ ';
    fila += '${companeros[i][1].padRight(15)} │ ';
    fila += '${companeros[i][2].padRight(5)} │ ';
    fila += '${companeros[i][3].padRight(10)} │ ';
    fila += '${companeros[i][4].padRight(10)} │';
    print(fila);
  }
  
  print('══════════════════════════════════════════════════════════════════════════════════');
}