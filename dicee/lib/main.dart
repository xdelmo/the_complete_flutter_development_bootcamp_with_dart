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

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () => (print('Left button got pressed')),
              child: Image.asset(
                "images/dice1.png",
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextButton(
              onPressed: () => (print('Right button got pressed')),
              child: Image.asset(
                "images/dice2.png",
              ),
            ),
          )
        ],
      ),
    );
  }
}
