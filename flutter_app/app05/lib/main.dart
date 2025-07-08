import 'dart:js_util';
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
title: "NFORMACION PERSONAL",
home: Scaffold(
appBar: AppBar(
foregroundColor: Colors.white,
backgroundColor: Colors.blue[900],
title: Text("Información Personal"),
),
body: Padding(
padding: const EdgeInsets.all(20.0),
child: Column(
children: [
Image(
  image: NetworkImage("https://cdn.pixabay.com/photo/2023/04/26/18/36/ai-generated-7953120_1280.png"),
  width: 200,
  height: 200, 
  fit: BoxFit.cover, 
),
ListTile(
title: Text("Jose David "),
subtitle: Text("Nombres"),
leading: Icon(Icons.person_outline, color: Color(0xFF2962FF), size: 36.0)),
 Divider(),
 ListTile(
title: Text("Daza Camacho"),
subtitle: Text("Apellidos"),
leading: Icon(Icons.person_add_alt, color: Color(0XFF880E4F), size: 36.0)),
Divider(),
ListTile(
title: Text("3213446510"),
subtitle: Text("Celular"),
leading: Icon(Icons.smartphone, color: Colors.blue, size: 36.0)),
Divider(),
ListTile(
title: Text("Bogota"),
subtitle: Text("Ciudad de recidencia"),
leading: Icon(Icons.house, color: Colors.green, size: 36.0)),
Divider(),
ListTile(
title: Text("jose123@gmail.com"),
subtitle: Text("Correo electronico"),
leading: Icon (Icons.email, color: Colors.red, size: 36.0)),
Divider(),
],
),
),
),
 );
   }
 }

