import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final VoidCallback onRestartQuiz;

  ResultScreen({required this.score, required this.onRestartQuiz});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your Score: $score/${3}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRestartQuiz,
            child: Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
