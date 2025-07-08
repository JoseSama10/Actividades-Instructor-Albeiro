import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ficha | 2925960",
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
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: Text("Ficha | 2925960"),
      ),
      body: ListView.builder(
        itemCount: sitiosTuristicos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            trailing: Icon(Icons.arrow_circle_right_outlined),
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(sitiosTuristicos[index]["foto_monumento"]),
            ),
            title: Text(
              sitiosTuristicos[index]["nombre"],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              sitiosTuristicos[index]["apellido"] ?? "Apellido no disponible",
            ),
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.green,
                      title: Text(sitiosTuristicos[index]["nombre"]),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ListView(
                        children: [
                          Center(
                            child: CircleAvatar(
                              radius: 100,
                              backgroundImage: NetworkImage(
                                sitiosTuristicos[index]["foto_monumento"],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Nombre: ${sitiosTuristicos[index]["nombre"]}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Divider(),
                          Text(
                            "Apellido: ${sitiosTuristicos[index]["apellido"]}",
                            style: TextStyle(fontSize: 18),
                          ),
                          Divider(),
                          Text(
                            "Teléfono: ${sitiosTuristicos[index]["telefono"]}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// Datos actualizados y corregidos
List<Map<String, dynamic>> sitiosTuristicos = [
  {
    'nombre': 'Jose David',
    'apellido': 'Daza',
    'telefono': '32124478190',
    'foto_monumento':
        'https://cdn.pixabay.com/photo/2023/04/26/09/25/ai-generated-7951985_1280.png'
  },
  {
    'nombre': 'Jose',
    'apellido': 'Zabaleta',
    'telefono': '32124478190',
    'foto_monumento':
        'https://cdn.pixabay.com/photo/2024/01/10/13/13/ai-generated-8499585_1280.png'
  },
  {
    'nombre': 'Cristian',
    'apellido': 'Monzón',
    'telefono': '32124478190',
    'foto_monumento':
        'https://cdn.pixabay.com/photo/2023/04/26/09/26/ai-generated-7951988_1280.png'
  },
];