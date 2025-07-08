import 'package:flutter/material.dart';
void main(List<String> args) {
  runApp(Principal());  
}
class Principal extends StatelessWidget {
  const Principal({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Ficha| 2925960",
      debugShowCheckedModeBanner: false,
      home: HomePrincipal(),
    );
  }
}
class HomePrincipal extends StatefulWidget {
  const HomePrincipal({super.key});
  @override
  State<HomePrincipal> createState() => _HomePrincipalState();
}
class _HomePrincipalState extends State<HomePrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        title: Text("Ficha|2925960 nombre aprendices"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(          
          itemCount: sitiosTuristicos.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text(sitiosTuristicos[index]),
              ),
            );
          },
        ),
      ),      
    );
  }
}
List<String> sitiosTuristicos = [
 "Jose David Daza",
 "Cristian Monzon",
 "Alejandra Montero",
 "Nicole",
 "Cristian melo",
 "Brayan",
 "Mikael Espitia",
 "Michael Vazques",
 "Kevin montealegre",
 "Julian Beltran",
 "Oscar Cruz",
 "David Meneses",
 "Juan",
 "Alejandro",
 "Miguel Angel"

];