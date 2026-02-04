import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go Back To Screen 1'),
          onPressed: () {
            Navigator.pushNamed(context, "/first");
          },
        ),
      ),
    );
  }
}
