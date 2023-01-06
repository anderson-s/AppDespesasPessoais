
 import 'package:despesas_pessoais/view/home.dart';
import 'package:flutter/material.dart';

main() {
   runApp(const Inicio());
}

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}