import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/pages/home_page.dart';
import 'package:quiz_app/pages/result_page.dart';
import 'package:quiz_app/pages/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (questions.length == selectedAnswers.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  switchScreen() {
    setState(() {
      activeScreen = 'home-screen';
    });
  }

  restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'home-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartPage(switchScreen);

    if (activeScreen == 'home-screen') {
      screenWidget = HomePage(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultPage(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      home: screenWidget,
    );
  }
}
