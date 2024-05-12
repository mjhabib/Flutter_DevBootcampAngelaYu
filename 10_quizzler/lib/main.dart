import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizzApp(),
          ),
        ),
      ),
    );
  }
}

class QuizzApp extends StatefulWidget {
  const QuizzApp({super.key});

  @override
  State<QuizzApp> createState() => _QuizzAppState();
}

// the list below can accept the type of 'Widget' or more specifically type of 'Icon' which is also a widget, because our 'Row' only accept a list of Widgets

// List<String> questions = [
//   'You can lead a cow down stairs but not up stairs.',
//   'Approximately one quarter of human bones are in the feet.',
//   'A slug\'s blood is green.'
// ];

// List<bool> answers = [false, true, true];

// dateType objectName = ClassName(param1, param2)
// Question qAndA = Question([
//   'You can lead a cow down stairs but not up stairs.',
//   'Approximately one quarter of human bones are in the feet.',
//   'A slug\'s blood is green.'
// ], [
//   false,
//   true,
//   true
// ]);

class _QuizzAppState extends State<QuizzApp> {
  void finishedQuiz() {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Congratulations",
      desc: "You've done great.",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            scoreKeeper = [];
          },
          width: 120,
          child: const Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  List<Icon> scoreKeeper = [];

  void checkAnswer(bool usersAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      quizBrain.nextQuestion();
      if (correctAnswer == usersAnswer) {
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      if (quizBrain.getQuestionText() == 'Done') {
        finishedQuiz();
        quizBrain.resetQuiz();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: TextButton(
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              checkAnswer(true);
            },
            child: const Text(
              'True',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red.shade700),
              onPressed: () {
                checkAnswer(false);
              },
              child: const Text(
                'False',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        )),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
