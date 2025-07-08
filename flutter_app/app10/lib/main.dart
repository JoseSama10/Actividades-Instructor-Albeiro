import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Principal());
}

final txtNombre = TextEditingController();
final txtApellido = TextEditingController();
final txtTelefono = TextEditingController();
final txtFoto = TextEditingController();

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ficha | 2925960",
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
        title: Text("Contactos"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: contactos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contactos[index]["foto"]),
            ),
            title: Text("${contactos[index]["nombre"]} ${contactos[index]["apellido"]}"),
            subtitle: Text(contactos[index]["telefono"]),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      title: Text("${contactos[index]["nombre"]} ${contactos[index]["apellido"]}"),
                    ),
                    body: ListView(
                      padding: EdgeInsets.all(16),
                      children: [
                        CircleAvatar(
                          radius: 100,
                          backgroundImage: NetworkImage(contactos[index]["foto"]),
                        ),
                        SizedBox(height: 20),
                        Text("Nombre: ${contactos[index]["nombre"]}", style: TextStyle(fontSize: 18)),
                        Text("Apellido: ${contactos[index]["apellido"]}", style: TextStyle(fontSize: 18)),
                        Text("Teléfono: ${contactos[index]["telefono"]}", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.purple,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Scaffold(
                appBar: AppBar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.purple,
                  title: Text("Nuevo Contacto"),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: txtNombre,
                          decoration: InputDecoration(
                            labelText: "Nombre",
                            hintText: "Ingresa el nombre",
                            icon: Icon(Icons.person),
                          ),
                        ),
                        TextFormField(
                          controller: txtApellido,
                          decoration: InputDecoration(
                            labelText: "Apellido",
                            hintText: "Ingresa el apellido",
                            icon: Icon(Icons.person_outline),
                          ),
                        ),
                        TextFormField(
                          controller: txtTelefono,
                          decoration: InputDecoration(
                            labelText: "Teléfono",
                            hintText: "Ingresa el número de teléfono",
                            icon: Icon(Icons.phone),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                        TextFormField(
                          controller: txtFoto,
                          decoration: InputDecoration(
                            labelText: "Foto",
                            hintText: "URL de la foto",
                            icon: Icon(Icons.image),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  onPressed: () {
                    if (txtNombre.text == "" || txtApellido.text == "" || txtTelefono.text == "" || txtFoto.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("ERROR! Todos los campos son obligatorios"),
                      ));
                    } else {
                      setState(() {
                        contactos.add({
                          'nombre': txtNombre.text,
                          'apellido': txtApellido.text,
                          'telefono': txtTelefono.text,
                          'foto': txtFoto.text,
                        });
                        txtNombre.clear();
                        txtApellido.clear();
                        txtTelefono.clear();
                        txtFoto.clear();
                      });
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Contacto guardado exitosamente."),
                      ));
                    }
                  },
                  child: Icon(Icons.save),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

List<Map<String, dynamic>> contactos = [
  {
    'nombre': 'Jose David',
    'apellido': 'Daza',
    'telefono': '3124567890',
    'foto': 'https://cdn.pixabay.com/photo/2024/01/10/13/13/ai-generated-8499583_960_720.png'
  },
  {
    'nombre': 'Maria Alejandra',
    'apellido': 'villazon',
    'telefono': '3109876543',
    'foto': 'https://cdn.pixabay.com/photo/2023/06/09/23/14/anime-8052801_1280.png'
  },
  {
    'nombre': 'Alejandro',
    'apellido': 'valbuena',
    'telefono': '3001234567',
    'foto': 'https://cdn.pixabay.com/photo/2023/03/05/19/51/ai-generated-7832126_960_720.jpg'
  },
];