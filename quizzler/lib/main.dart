import 'package:flutter/material.dart';
import 'package:quizzler/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text('Quizzler'),
          titleTextStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
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
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool isGameOver = false;
  List<Icon> scoreKeeper = [];

  Icon buildIcon(bool icon) {
    return icon
        ? Icon(Icons.check, color: Colors.green)
        : Icon(Icons.close, color: Colors.red);
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
              child: Text(
                "RESTART",
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              onPressed: () {
                Navigator.pop(context);
                _resetQuizzler();
              },
              width: 120,
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
            SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: () {
                _resetQuizzler();
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Icon(
                Icons.restore,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(color: Colors.white)),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: !isGameOver
                  ? () {
                      _checkAnswer(true);
                    }
                  : null,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: !isGameOver
                  ? () {
                      _checkAnswer(false);
                    }
                  : null,
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
