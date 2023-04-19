import 'package:flutter/material.dart';
import 'package:imc/calcula_imc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'IMC Calculator',
      debugShowCheckedModeBanner: false,
      home: ImcCalculator(),
    );
  }
}
