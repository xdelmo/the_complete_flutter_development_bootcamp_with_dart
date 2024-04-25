import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
              child: Center(
            child: DicePage(),
          )),
        ),
      ),
    ),
  );
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            "images/dice1.png",
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Image.asset(
            "images/dice2.png",
          ),
        )
      ],
    );
  }
}
