import 'dart:io';

void main() {
  // Matriz de productos (4x10)
  final List<List<dynamic>> productos = [
    ['001', 'Laptop HP', 1200000, true],
    ['002', 'Mouse inalámbrico', 85000, true],
    ['003', 'Teclado mecánico', 250000, true],
    ['004', 'Monitor 24"', 800000, true],
    ['005', 'Memoria USB 32GB', 45000, false],
    ['006', 'Disco Duro 1TB', 300000, true],
    ['007', 'Auriculares Bluetooth', 180000, true],
    ['008', 'Altavoz inalámbrico', 150000, true],
    ['009', 'Webcam HD', 120000, false],
    ['010', 'Tablet 10"', 950000, true]
  ];

  // Matriz de factura (11x7) inicialmente vacía
  List<List<dynamic>> factura = List.generate(11, (index) => List.filled(7, null));

  int contadorItems = 0;

  print('=== SISTEMA DE FACTURACIÓN ===\n');
  
  // Mostrar productos disponibles
  print('Productos disponibles:');
  print('ID\tNombre\t\t\tPrecio\t\tIVA');
  for (var producto in productos) {
    print('${producto[0]}\t${producto[1].padRight(20)}\t\$${producto[2].toString().padLeft(9)}\t${producto[3] ? 'Sí' : 'No'}');
  }

  // Proceso de compra
  while (contadorItems < 10) {
    print('\nIngrese el ID del producto (o "fin" para terminar):');
    String entrada = stdin.readLineSync()!.trim();
    
    if (entrada.toLowerCase() == 'fin') {
      break;
    }

    // Buscar producto
    var productoSeleccionado;
    try {
      productoSeleccionado = productos.firstWhere((p) => p[0] == entrada);
    } catch (e) {
      print('ID no válido. Intente nuevamente.');
      continue;
    }

    // Pedir cantidad
    print('Ingrese la cantidad para ${productoSeleccionado[1]}:');
    int cantidad;
    try {
      cantidad = int.parse(stdin.readLineSync()!);
      if (cantidad <= 0) throw FormatException();
    } catch (e) {
      print('Cantidad no válida. Intente nuevamente.');
      continue;
    }

    // Calcular valores
    double precioUnitario = productoSeleccionado[2].toDouble();
    bool tieneIVA = productoSeleccionado[3];
    double valorIVA = tieneIVA ? precioUnitario * 0.19 : 0.0;
    double valorTotal = (precioUnitario + valorIVA) * cantidad;

    // Llenar la factura
    factura[contadorItems][0] = contadorItems + 1; // Ítem
    factura[contadorItems][1] = productoSeleccionado[0]; // ID
    factura[contadorItems][2] = productoSeleccionado[1]; // Nombre
    factura[contadorItems][3] = cantidad; // Cantidad
    factura[contadorItems][4] = precioUnitario; // Valor unidad
    factura[contadorItems][5] = valorIVA * cantidad; // IVA total
    factura[contadorItems][6] = valorTotal; // Valor total

    contadorItems++;

    print('Producto agregado a la factura.');
  }

  // Generar factura
  print('\n=== FACTURA ===\n');
  print('No.\tID\tNombre\t\t\tCant.\tV. Unit.\tIVA\tTotal');

  double totalFactura = 0.0;
  for (int i = 0; i < contadorItems; i++) {
    print('${factura[i][0]}\t'
          '${factura[i][1]}\t'
          '${factura[i][2].toString().padRight(20)}\t'
          '${factura[i][3]}\t'
          '\$${factura[i][4].toString().padLeft(9)}\t'
          '\$${factura[i][5].toStringAsFixed(2).padLeft(8)}\t'
          '\$${factura[i][6].toStringAsFixed(2).padLeft(10)}');
    
    totalFactura += factura[i][6];
  }

  // Calcular resumen
  double subTotal = totalFactura - factura.fold(0.0, (sum, item) => sum + (item[5] ?? 0.0));
  double ivaTotal = factura.fold(0.0, (sum, item) => sum + (item[5] ?? 0.0));

  print('\nRESUMEN:');
  print('Subtotal: \$${subTotal.toStringAsFixed(2)}');
  print('IVA: \$${ivaTotal.toStringAsFixed(2)}');
  print('TOTAL A PAGAR: \$${totalFactura.toStringAsFixed(2)}');
  print('\nGracias por su compra!');
}