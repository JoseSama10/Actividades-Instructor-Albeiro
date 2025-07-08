void main() {
  print('TABLAS DE MULTIPLICAR DEL 1 AL 10');
  print('----------------------------------\n');
  
  // Encabezados de columnas
  String header = '';
  for (int i = 1; i <= 10; i++) {
    header += 'Tabla $i'.padRight(12);
  }
  print(header);
  print('-' * 120);
  
  // Filas con resultados
  for (int fila = 1; fila <= 10; fila++) {
    String linea = '';
    for (int tabla = 1; tabla <= 10; tabla++) {
      int resultado = tabla * fila;
      linea += '${tabla} x $fila = ${resultado.toString().padLeft(2)}'.padRight(12);
    }
    print(linea);
  }
}