

Run
Copy code
import 'dart:io';

void main() {
  print('CÁLCULO DE VALOR DE COMPRA');
  print('---------------------------');

  // Solicitar nombre del artículo
  stdout.write('Ingrese el nombre del artículo: ');
  String articulo = stdin.readLineSync()!;

  // Solicitar valor unitario con validación
  double valorUnitario;
  do {
    stdout.write('Ingrese el valor por unidad: ');
    valorUnitario = double.tryParse(stdin.readLineSync()!) ?? -1;
    if (valorUnitario <= 0) {
      print('Valor inválido. Debe ser mayor a cero.\n');
    }
  } while (valorUnitario <= 0);

  // Solicitar cantidad con validación
  int cantidad;
  do {
    stdout.write('Ingrese la cantidad a llevar: ');
    cantidad = int.tryParse(stdin.readLineSync()!) ?? -1;
    if (cantidad <= 0) {
      print('Cantidad inválida. Debe ser mayor a cero.\n');
    }
  } while (cantidad <= 0);

  // Solicitar si pertenece a canasta familiar con validación
  String respuesta;
  bool esCanasta = false;
  do {
    stdout.write('¿Pertenece a la canasta familiar? (sí/no): ');
    respuesta = stdin.readLineSync()!.toLowerCase();
    
    if (respuesta == 'sí' || respuesta == 'si' || respuesta == 's') {
      esCanasta = true;
    } else if (respuesta == 'no' || respuesta == 'n') {
      esCanasta = false;
    } else {
      print('Respuesta inválida. Por favor responda sí o no.\n');
    }
  } while (respuesta != 'sí' && respuesta != 'si' && respuesta != 's' && 
            respuesta != 'no' && respuesta != 'n');

  // Calcular totales
  double subTotal = valorUnitario * cantidad;
  double iva = 0;
  double total = subTotal;
  
  if (!esCanasta) {
    iva = subTotal * 0.19; // Calcular IVA 19%
    total = subTotal + iva;
  }

  // Mostrar resultados
  print('\nDETALLE DE COMPRA');
  print('=============================');
  print('Artículo: $articulo');
  print('Valor unitario: \$${valorUnitario.toStringAsFixed(2)}');
  print('Cantidad: $cantidad');
  print('Subtotal: \$${subTotal.toStringAsFixed(2)}');
  
  if (!esCanasta) {
    print('IVA (19%): \$${iva.toStringAsFixed(2)}');
  }
  
  print('------------------------------');
  print('TOTAL A PAGAR: \$${total.toStringAsFixed(2)}');
  print('=============================');
  
  if (esCanasta) {
    print('(Exento de IVA por pertenecer a canasta familiar)');
  }
}