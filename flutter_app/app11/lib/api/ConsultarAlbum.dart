import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> ConsultarAlbum() async {
  var url = Uri.parse("https://jsonplaceholder.typicode.com/albums");
  final response = await http.get(url);
  return compute(pasaraListaAlbums, response.body);
}

List<Album> pasaraListaAlbums(String respuestaBody) {
  final pasar = json.decode(respuestaBody).cast<Map<String, dynamic>>();
  return pasar.map<Album>((json) => Album.fromJson(json)).toList();
}

class Album {
  final id;
  final title;

  Album({this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}