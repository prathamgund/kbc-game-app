import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class KbcGame extends StatefulWidget {
  const KbcGame({super.key});

  @override
  State<KbcGame> createState() => _QuizPageState(); 
}

class _QuizPageState extends State<KbcGame> {
  List<Icon> scoreKeeper = [];
  QuizBrain quizBrain = QuizBrain();
  Map<String, String> allOptions = {};

  int score = 0;

  void checkAnswer(String userSelectedButton) {
    String correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (correctAnswer == userSelectedButton) {
        score++;
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
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: "Congrats!",
          desc: "Your score is: $score out of ${quizBrain.getListLength()}.")
          .show();
          quizBrain.reset();
          scoreKeeper = [];
          score = 0;
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    allOptions = quizBrain.getAllOptions();
  }

  Widget displayOptionButtons(String optionLabel) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: TextButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.teal),
            foregroundColor: MaterialStatePropertyAll(Colors.white),
          ),
          onPressed: () {
            checkAnswer(optionLabel);
            allOptions = quizBrain.getAllOptions();
          },
          child: Text(
            '$optionLabel: ${allOptions[optionLabel]}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ), 
          ),
        ),
      ), 
      );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        displayOptionButtons('A'),
        displayOptionButtons('B'),
        displayOptionButtons('C'),
        displayOptionButtons('D'),
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
  }