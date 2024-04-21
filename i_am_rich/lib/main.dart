import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "I Am Rich",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: const Center(
          child: Image(
            image: NetworkImage(
                'https://th.bing.com/th/id/OIP.DDsqzQ_y7ee5TGKl0qEi-QHaE8?rs=1&pid=ImgDetMain'),
          ),
        ),
      ),
    ),
  );
}
