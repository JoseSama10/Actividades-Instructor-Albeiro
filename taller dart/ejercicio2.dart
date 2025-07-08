import 'dart:io';

void main() {
  // Solicita la información al usuario
  print('Ingrese su nombre:');
  String nombre = stdin.readLineSync() ?? '';

  print('Ingrese su sexo (Masculino/Femenino/Otro):');
  String sexo = stdin.readLineSync() ?? '';

  print('Ingrese su edad:');
  int edad = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  print('Ingrese su salario en COP (con centavos, ej: 2500000.75):');
  double salario = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;

  print('¿Tiene vehículo de transporte? (Sí/No):');
  String tieneVehiculo = stdin.readLineSync()?.toLowerCase() ?? '';

  // Valida entrada del vehículo
  bool vehiculo = tieneVehiculo == 'sí' || tieneVehiculo == 'si';

  // Muestra la información
  print('\n--- Información Personal ---');
  print('Nombre: $nombre');
  print('Sexo: $sexo');
  print('Edad: $edad años');
  print('Salario: \$${salario.toStringAsFixed(2)} COP');
  print('Tiene vehículo: ${vehiculo ? "Sí" : "No"}');
}