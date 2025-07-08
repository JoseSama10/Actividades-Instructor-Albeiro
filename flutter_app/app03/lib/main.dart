import 'package:flutter/material.dart';
void main(List<String>args){
runApp(Principal());
}
class Principal extends StatelessWidget{
  const Principal({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "SENA  | DISTRITO CAPITAL| CEET",
      home: Column(
children: [
Text("Aprendiz"),
Text("Jose David Daza"),
Icon(Icons.home),
Icon(Icons.settings),
ElevatedButton(onPressed: (){}, child: Text("Crear")),
ElevatedButton(onPressed: (){}, child: Text("Editar")),
ElevatedButton(onPressed: (){}, child:  Text("Enviar")),
  
],
      ),
    );
  }
}