import 'package:app11/api/ConsultarAlbum.dart';
import 'package:app11/api/ConsultarFotos.dart';
import 'package:app11/api/ConsultarNoticias.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const Principal());
}

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Aprendiz | Jose David Daza",
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
  final Color colorPrincipal = Colors.green.shade700;
  final Color fondoCard = Colors.tealAccent.shade100;
  final Color colorIcono = const Color(0xFF800000); // Vinotinto

  final TextStyle estiloTitulo = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio-api"),
        backgroundColor: colorPrincipal,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            _buildCard(
              icono: Icons.newspaper,
              titulo: "Noticias",
              onTap: () async {
                final noticias = await ConsultarNoticias();
                _mostrarModal(
                  context,
                  titulo: "Noticias",
                  contenido: ListView.builder(
                    itemCount: noticias.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: fondoCard,
                        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text(
                            noticias[index].title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(noticias[index].body),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            _buildCard(
              icono: Icons.comment,
              titulo: "Comentarios",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Funcionalidad en desarrollo")),
                );
              },
            ),
            _buildCard(
              icono: Icons.album,
              titulo: "Álbumes",
              onTap: () async {
                final albums = await ConsultarAlbum();
                _mostrarModal(
                  context,
                  titulo: "Álbumes",
                  contenido: ListView.builder(
                    itemCount: albums.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: fondoCard,
                        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: const Icon(Icons.library_music),
                          title: Text(albums[index].title),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            _buildCard(
              icono: Icons.photo,
              titulo: "Fotos",
              onTap: () async {
                final fotos = await ConsultarFotos();
                _mostrarModal(
                  context,
                  titulo: "Fotos",
                  contenido: ListView.builder(
                    itemCount: fotos.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: fondoCard,
                        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                        elevation: 3,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(fotos[index].thumbnailUrl),
                          ),
                          title: Text(fotos[index].title),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Método reutilizable para construir una tarjeta de acción
  Widget _buildCard({
    required IconData icono,
    required String titulo,
    required VoidCallback onTap,
  }) {
    return Card(
      color: fondoCard,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: ListTile(
        leading: Icon(icono, color: colorIcono, size: 30),
        title: Text(titulo, style: estiloTitulo),
        trailing: Icon(Icons.arrow_circle_right_outlined, size: 28, color: colorIcono),
        onTap: onTap,
      ),
    );
  }

  /// Método para mostrar un modal con AppBar personalizado
  void _mostrarModal(BuildContext context,
      {required String titulo, required Widget contenido}) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      builder: (context) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Text(titulo),
              backgroundColor: colorPrincipal,
              foregroundColor: Colors.white,
              centerTitle: true,
              elevation: 2,
            ),
            body: contenido,
          ),
        );
      },
    );
  }
}