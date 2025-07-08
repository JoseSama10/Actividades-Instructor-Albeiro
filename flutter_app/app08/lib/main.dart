import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ficha|2925960",
      home: const HomePrinicipal(),
    );
  }
}

class HomePrinicipal extends StatefulWidget {
  const HomePrinicipal({super.key});

  @override
  State<HomePrinicipal> createState() => _HomePrinicipalState();
}

class _HomePrinicipalState extends State<HomePrinicipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        title: const Text("ficha/2925960"),
      ),
      body: ListView.builder(
        itemCount: sitiosTuristicos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.flag),
            title: Text(sitiosTuristicos[index]['nombre']),
            subtitle: Text(sitiosTuristicos[index]['telefono']), // Changed to 'telefono'
          );
        },
      ),
    );
  }
}

List<Map<String, dynamic>> sitiosTuristicos = [
  {
    'nombre': 'Nicole',
    'telefono': '3139895019',
  },
  {
    'nombre': 'Fabian amaya',
    'telefono': '3114578910',
  },
  {
    'nombre': 'Alejandra Montero',
    'telefono': '3112313415',
  },
  {
    'nombre': 'Kevin montealegre',
    'telefono': '3452819491',
  },
  {
    'nombre': 'Jose Zabaleta',
    'telefono': '3212111241',
  },
  {
    'nombre': 'johan',
    'telefono': '3212111241',
  },
  {
    'nombre': 'Brayan',
    'telefono': '3212111241',
  },
  {
    'nombre': 'Juan',
    'telefono': '3656819210',
  },
];