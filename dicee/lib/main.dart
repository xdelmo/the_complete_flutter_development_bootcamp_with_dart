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
  bool isSameDiceFace = false;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = getRandomNumberRange(1, 6);
      rightDiceNumber = getRandomNumberRange(1, 6);
    });
    checkSameDiceFace();
  }

  void checkSameDiceFace() {
    if (leftDiceNumber == rightDiceNumber) {
      setState(() {
        isSameDiceFace = true;
      });
    } else {
      setState(() {
        isSameDiceFace = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => changeDiceFace(),
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
                  onPressed: () => changeDiceFace(),
                  child: Image.asset(
                    "images/dice$rightDiceNumber.png",
                  ),
                ),
              ),
            ],
          ),
        ),
        isSameDiceFace
            ? Text(
                'YOU WON!',
                style: TextStyle(
                    letterSpacing: 10,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            : Text('')
      ],
    );
  }
}

int getRandomNumberRange(int plusNumber, int rangeNumber) {
  return Random().nextInt(rangeNumber) + plusNumber;
}
