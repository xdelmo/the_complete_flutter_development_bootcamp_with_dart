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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/avatar.png'),
                ),
                Text(
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
                      color: Colors.teal.shade100,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Code Pro',
                      letterSpacing: 2.5),
                ),
                SizedBox(
                  height: 20,
                  width: 150,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Card(
                  elevation: 10.0,
                  shadowColor: Colors.teal.shade900,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.smartphone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '+39 38099999999',
                      style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'Source Code Pro',
                          fontSize: 15),
                    ),
                  ),
                ),
                Card(
                  elevation: 10.0,
                  shadowColor: Colors.teal.shade900,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'info@emanueledelmonte.it',
                      style: TextStyle(
                          color: Colors.teal.shade900,
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
