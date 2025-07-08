import 'dart:io';
import 'dart:math';

void main() {
  // Muestra las reglas del juego
  print('''
  === BIENVENIDO AL JUEGO DE LA GUAYABITA ===
  
  Reglas del juego:
  1. Se ingresa la cantidad de jugadores
  2. Cada jugador tiene un tiro inicial:
     - Si saca 1 o 6: pierde y coloca 1 moneda en el acumulado
  3. Con otros números:
     - Apostará hasta el máximo del acumulado
     - Si en el segundo tiro saca mayor que el primero: gana lo apostado
     - De lo contrario: coloca lo apostado en el acumulado
  4. El juego continúa mientras el acumulado sea mayor a 0
  ''');

  Random random = Random();
  int acumulado = 0;
  List<int> jugadores = [];
  int jugadorActual = 0;

  // Solicitar número de jugadores
  print('Ingrese la cantidad de jugadores:');
  int cantidadJugadores = int.parse(stdin.readLineSync()!);
  
  for (int i = 0; i < cantidadJugadores; i++) {
    jugadores.add(0); // Inicializar saldos en 0
  }

  // Bucle principal del juego
  while (true) {
    // Mostrar acumulado antes de cada ronda
    print('\n=== ACUMULADO ACTUAL: $acumulado ===');

    // Verificar si el juego puede continuar
    if (acumulado <= 0) {
      print('El acumulado es $acumulado. El juego ha terminado.');
      break;
    }

    // Turno del jugador actual
    print('\nTurno del Jugador ${jugadorActual + 1}');
    
    // Primer tiro
    int primerTiro = random.nextInt(6) + 1;
    print('Primer tiro: $primerTiro');

    if (primerTiro == 1 || primerTiro == 6) {
      // Caso 1: Pierde y coloca 1 moneda
      print('Sacaste $primerTiro! Debes colocar 1 moneda en el acumulado.');
      jugadores[jugadorActual] -= 1;
      acumulado += 1;
    } else {
      // Caso 2: Puede apostar
      print('Puedes apostar (máximo: $acumulado).');
      int apuesta = 0;
      
      // Validar apuesta
      while (apuesta <= 0 || apuesta > acumulado) {
        print('Ingrese su apuesta (1-$acumulado):');
        apuesta = int.parse(stdin.readLineSync()!);
        
        if (apuesta <= 0 || apuesta > acumulado) {
          print('Apuesta inválida!');
        }
      }

      // Segundo tiro
      int segundoTiro = random.nextInt(6) + 1;
      print('Segundo tiro: $segundoTiro');

      if (segundoTiro > primerTiro) {
        // Gana lo apostado
        print('Ganaste! Recibes $apuesta monedas.');
        jugadores[jugadores.indexOf(jugadorActual)] += apuesta;
        acumulado -= apuesta;
      } else {
        // Pierde lo apostado
        print('Perdiste! Colocas $apuesta monedas en el acumulado.');
        jugadores[jugadores.indexOf(jugadorActual)] -= apuesta;
        acumulado += apuesta;
      }
    }

    // Mostrar estado de los jugadores
    print('\nEstado actual de los jugadores:');
    for (int i = 0; i < jugadores.length; i++) {
      print('Jugador ${i + 1}: ${jugadores[i]} monedas');
    }

    // Pasar al siguiente jugador
    jugadorActual = (jugadorActual + 1) % cantidadJugadores;

    // Pausa para continuar
    print('\nPresiona Enter para continuar...');
    stdin.readLineSync();
  }

  // Mostrar resultados finales
  print('\n=== RESULTADOS FINALES ===');
  for (int i = 0; i < jugadores.length; i++) {
    print('Jugador ${i + 1}: ${jugadores[i]} monedas');
  }
}
