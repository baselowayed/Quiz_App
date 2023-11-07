import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/options_screen.dart';
import 'package:quiz_app/questionss_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      // activeScreen = const QuistionsScreen();
      activeScreen = 'option-screen';
    });
  }

  void startQuiz() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  // void StartTraining(){

  // }

  void chooseAnswer(String answer, int pos) {
    if (selectedAnswers.length >= pos + 1) {
      selectedAnswers.removeAt(pos);
    }
    selectedAnswers.insert(pos, answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void onRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  // void

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'option-screen') {
      screenWidget = OptionScreen(choseQuizMode: startQuiz);
    }

    if (activeScreen == 'question-screen') {
      screenWidget = QuistionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'result-screen') {
      screenWidget =
          ResultScreen(chosenAnswers: selectedAnswers, restart: onRestart);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 91, 0, 105),
                Color.fromARGB(255, 91, 0, 105)
              ], begin: Alignment.topRight, end: Alignment.bottomRight),
              //color: Colors.purple,
            ),
            //child: activeScreen),
            child: screenWidget),
      ),
    );
  }
}
