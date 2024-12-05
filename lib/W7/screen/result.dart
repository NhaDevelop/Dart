import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final VoidCallback onRestartQuiz;

  const ResultScreen({super.key, required this.score, required this.onRestartQuiz});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your Score: $score/${3}',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRestartQuiz,
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
