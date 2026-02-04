import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text('Quizzler'),
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool isGameOver = false;
  List<Icon> scoreKeeper = [];

  Icon buildIcon(bool icon) {
    return icon
        ? const Icon(Icons.check, color: Colors.green)
        : const Icon(Icons.close, color: Colors.red);
  }

  void _checkAnswer(bool userPickedAnswer) {
    setState(() {
      if (!quizBrain.isFinished()) {
        if (quizBrain.getCorrectAnswer() == userPickedAnswer) {
          scoreKeeper.add(buildIcon(true));
        } else {
          scoreKeeper.add(buildIcon(false));
        }
        quizBrain.nextQuestion();
      } else {
        Alert(
          context: context,
          type: AlertType.info,
          title: "QUIZ IS OVER",
          desc: "Try again!",
          buttons: [
            DialogButton(
              color: Colors.blue.shade500,
              onPressed: () {
                Navigator.pop(context);
                _resetQuizzler();
              },
              width: 120,
              child: const Text(
                "RESTART",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
            )
          ],
        ).show();
      }
    });
  }

  void _resetQuizzler() {
    setState(() {
      isGameOver = false;
      quizBrain.reset();
      scoreKeeper = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                _resetQuizzler();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Icon(
                Icons.restore,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: const TextStyle(color: Colors.white)),
              onPressed: !isGameOver
                  ? () {
                      _checkAnswer(true);
                    }
                  : null,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: !isGameOver
                  ? () {
                      _checkAnswer(false);
                    }
                  : null,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}
