// ignore_for_file: library_private_types_in_public_api

import 'package:dicey/quiz_brain.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
  QuizBrain quizBrain = QuizBrain();

  List<Icon> scoreKeeper = [];

  // EndAlert endAlert = EndAlert();

  void checkAnswer(bool userPickedAnswer) {
    bool? correctAnswer = quizBrain.getAnswer();

    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          
          context: context,
          type: AlertType.success,
          title: "END OF QUIZ",
          desc: "You've reached the end of the quiz.",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Quizzler()),
              ),
              width: 120,
              child: const Text(
                "RESET",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
        quizBrain.setQuizNumber();
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          print('got it right');
          scoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          print('got it wrong');
          scoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }

      quizBrain.nextQuestion();
    });
  }

  // List<bool> answers = [false, true, true];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuiz(),
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
              onPressed: () {
                setState(() {
                  checkAnswer(true);
                });
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.yellow[500];
                    }
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed)) {
                      return Colors.green[900];
                    }
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
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
              onPressed: () {
                //setState(() {
                checkAnswer(false);
                //});
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                //groundColor:
                //    MaterialStateProperty.all<Color>(Colors.redAccent),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.yellow.withOpacity(0.04);
                    }
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed)) {
                      return Colors.red[900];
                    }
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
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

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

