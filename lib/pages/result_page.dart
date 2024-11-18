import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/widgets/questions_summary.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'chosen_answer': chosenAnswers[i],
        'answer': questions[i].answer,
      });
    }
    return summary;
  }

  int getCorrectAnswersCount() {
    int correctAnswers = 0;

    for (int i = 0; i < chosenAnswers.length; i++) {
      if (chosenAnswers[i] == questions[i].answer) {
        correctAnswers++;
      }
    }

    return correctAnswers;
  }

  @override
  Widget build(BuildContext context) {
    int correctAnswers = getCorrectAnswersCount();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You've answered $correctAnswers out of ${questions.length} questions correct.",
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              height: 550,
              child: SingleChildScrollView(
                  child: QuestionsSummary(getSummaryData()))),
          TextButton.icon(
            onPressed: restartQuiz,
            icon: const Icon(
              FontAwesomeIcons.rotate,
              size: 16,
            ),
            label: const Text('Restart quiz!'),
          ),
        ],
      )),
    );
  }
}
