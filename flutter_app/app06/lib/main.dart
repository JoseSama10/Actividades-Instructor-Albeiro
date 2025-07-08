import 'package:flutter/material.dart';
void main(List<String> args) {
runApp(Principal());
 }
  class Principal extends StatelessWidget {
  const Principal({super.key});
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
title: "SENA | CEET",
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
title: Text("FICHA| 2925960"),
 ),
body: GridView.builder(
gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 5,
),
itemCount: 50,
 itemBuilder: (BuildContext context, int index) {
return Card(
child: Center(child: Text(index.toString())),
color: Colors.cyan,
);
  },
 ),
  );
 }
}
