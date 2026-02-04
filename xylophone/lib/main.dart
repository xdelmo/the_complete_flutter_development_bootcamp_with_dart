import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.setSource(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKeyNote(
    Color color,
    int soundNumber,
  ) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: color),
        onPressed: () {
          playSound(soundNumber);
        },
        child: const Text(''),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text('Xylophone'),
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKeyNote(Colors.red, 1),
              buildKeyNote(Colors.orange, 2),
              buildKeyNote(Colors.yellow, 3),
              buildKeyNote(Colors.green, 4),
              buildKeyNote(Colors.teal, 5),
              buildKeyNote(Colors.blue, 6),
              buildKeyNote(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
