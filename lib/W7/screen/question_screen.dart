import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
  final String question;
  final List<String> choices;
  final Function(String) onNextQuestion;

  const QuestionScreen({super.key, 
    required this.question,
    required this.choices,
    required this.onNextQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            question,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ...choices.map(
            (choice) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  onNextQuestion(choice); 
                },
                child: Text(choice),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
