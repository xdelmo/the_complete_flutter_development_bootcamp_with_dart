import 'dart:math';

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
        body: SafeArea(
          child: DicePage(),
        ),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () => (setState(() {
                leftDiceNumber = getRandomNumberRange(1, 6);
              })),
              child: Image.asset(
                "images/dice$leftDiceNumber.png",
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextButton(
              onPressed: () => (setState(() {
                rightDiceNumber = getRandomNumberRange(1, 6);
              })),
              child: Image.asset(
                "images/dice$rightDiceNumber.png",
              ),
            ),
          )
        ],
      ),
    );
  }
}

int getRandomNumberRange(int firstNumber, int secondNumber) {
  Random random = Random();
  return random.nextInt(secondNumber) + firstNumber;
}
