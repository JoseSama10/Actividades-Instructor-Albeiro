import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Fotos>> ConsultarFotos() async {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
  final response = await http.get(url);
  return compute(pasaraListaFotos, response.body);
}

List<Fotos> pasaraListaFotos(String respuestaBody) {
  final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();
  return pasar.map<Fotos>((json) => Fotos.fromJson(json)).toList();
}

class Fotos {
  final id;
  final title;
  final albumId;
  final thumbnailUrl;

  Fotos({this.id, this.title, this.albumId, this.thumbnailUrl});

  factory Fotos.fromJson(Map<String, dynamic> json) {
    return Fotos(
      id: json['id'],
      title: json['title'],
      albumId: json['albumId'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
