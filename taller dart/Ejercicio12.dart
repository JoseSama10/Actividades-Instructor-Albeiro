import 'dart:math';

void main() {
  print('JUEGO DE PARQUES - SIMULACIÓN DE DADOS');
  print('--------------------------------------');
  
  // Lanzamiento inicial
  Random random = Random();
  int dado1 = random.nextInt(6) + 1; // Genera número entre 1-6
  int dado2 = random.nextInt(6) + 1; // Genera número entre 1-6
  
  int intentosPares = 0;
  int totalLanzamientos = 1; // Contador de lanzamientos
  
  print('Lanzamiento inicial: Dado1 = $dado1, Dado2 = $dado2');
  
  while (intentosPares < 3) {
    // Verificar si es par (mismo número)
    if (dado1 == dado2) {
      intentosPares++;
      
      // Mostrar resultado según número de pares consecutivos
      if (intentosPares == 3) {
        print('¡Saca una ficha! (3 pares consecutivos)');
        break;
      } else {
        print('¡Lanzar de nuevo! ($intentosPares par consecutivo)');
      }
    } else {
      print('¡Lanza de nuevo! (no es par)');
      intentosPares = 0; // Reiniciar contador
    }
    
    // Solo hacer nuevos lanzamientos si no llevamos 3 pares
    if (intentosPares < 3) {
      // Nuevo lanzamiento
      dado1 = random.nextInt(6) + 1;
      dado2 = random.nextInt(6) + 1;
      totalLanzamientos++;
      print('Lanzamiento $totalLanzamientos: Dado1 = $dado1, Dado2 = $dado2');
    }
  }
  
  print('Fin del juego');
}