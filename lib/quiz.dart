import 'package:flutter/material.dart';
import 'package:quiz_app2/question_screen.dart';
import 'package:quiz_app2/result_screen.dart';
import 'package:quiz_app2/start_screen.dart';

import 'data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState() {
    // TODO: implement initState
    activeScreen =   StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen(){
    setState(() {
      activeScreen =  QuestionScreen(onSelectAnswer:  chooseAnswer,);
    });
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = StartScreen(switchScreen);
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen =   ResultScreen(chosenAnswer: selectedAnswers, onRestart: restartQuiz);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple.shade900, Colors.blue.shade900],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
