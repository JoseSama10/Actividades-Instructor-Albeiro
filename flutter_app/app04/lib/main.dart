   import 'package:flutter/material.dart';
  void main(List<String> args) {
  runApp(Principal());
  }
  class Principal extends StatelessWidget {
  const Principal({super.key});
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
  title: "Datos Personales",
  home: Scaffold(
  appBar: AppBar(
  backgroundColor: Colors.yellow,
  title: Text("SENA | CEET"),
  ),
 body: Column(
 children: [
Text("Aprendiz"),
Text("Jose David Daza Camacho"),
Icon(Icons.person),
Icon(Icons.notifications),
ElevatedButton(onPressed: (){}, child: Text("Crear")),
ElevatedButton(onPressed: (){}, child: Text("Editar")),
ElevatedButton(onPressed: (){}, child: Text("Enviar")),
],
  ),
  ),
 );
 }
 }