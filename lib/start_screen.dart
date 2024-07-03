import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz ,{super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Image(
            image: AssetImage('assets/images/quiz-logo.png'),
            width: 300,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton.icon(
          onPressed: startQuiz,
          icon: const Icon(Icons.arrow_right_alt),
          label: const Text('Start Quiz'),
        ),
      ],
    );
  }
}
