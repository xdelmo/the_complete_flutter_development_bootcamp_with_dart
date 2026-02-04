import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/avatar.png'),
                ),
                const Text(
                  'Emanuele Del Monte',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico'),
                ),
                Text(
                  'JUNIOR FRONTEND DEVELOPER',
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue.shade100,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Code Pro',
                      letterSpacing: 2.5),
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Colors.blue.shade100,
                  ),
                ),
                Card(
                  elevation: 10.0,
                  shadowColor: Colors.blue.shade900,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: const Icon(
                      Icons.smartphone,
                      color: Colors.blue,
                    ),
                    title: Text(
                      '+39 38099999999',
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontFamily: 'Source Code Pro',
                          fontSize: 15),
                    ),
                  ),
                ),
                Card(
                  elevation: 10.0,
                  shadowColor: Colors.blue.shade900,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    title: Text(
                      'info@emanueledelmonte.it',
                      style: TextStyle(
                          color: Colors.blue.shade900,
                          fontFamily: 'Source Code Pro',
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
