import 'package:flutter/material.dart';

Color colorPrimary =
    const Color(0xFFF1BC19); // Aggiunto FF per l'opacità completa
Color colorSecondary =
    const Color(0xFFE4E4F9); // Aggiunto FF per l'opacità completa

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: colorSecondary,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "I Am Poor",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: colorPrimary,
        ),
        body: const Center(
          child: Image(
            image: AssetImage('images/icons8-carbone-80.png'),
          ),
        ),
      ),
    ),
  );
}
