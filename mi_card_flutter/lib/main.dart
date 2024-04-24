import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: Text("Container 1"),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.teal,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.blue,
              child: Text("Container 3"),
            ),
          ],
        )),
      ),
    );
  }
}
