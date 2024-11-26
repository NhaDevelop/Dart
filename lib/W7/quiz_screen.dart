import 'package:flutter/material.dart';
import '../W7/model/submission.dart';
import '../W7/screen/welcome.dart';
import '../W7/screen/question_screen.dart';
import '../W7/screen/result.dart';

enum ScreenState { welcome, question, result }

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  ScreenState _currentScreen = ScreenState.welcome;


  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'who is the best programing teacher ?',
      'choices': ['ronan', 'ronan', 'ronan'],
      'correctAnswer': 'ronan',
    },
    {
      'question': 'Who developed Dart?',
      'choices': ['Facebook', 'Microsoft', 'Google'],
      'correctAnswer': 'Google',
    },
    {
      'question': 'What is the capital of France?',
      'choices': ['London', 'Paris', 'Berlin'],
      'correctAnswer': 'Paris',
    },
  ];

  final Submission _submission = Submission(answers: [], userAnswer: '');


  int _currentQuestionIndex = 0;


  void _nextQuestion(String selectedAnswer) {
    setState(() {
      _submission.answers.add(selectedAnswer);
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _currentScreen = ScreenState.result;
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      _submission.reset();
      _currentScreen = ScreenState.welcome;
      _currentQuestionIndex = 0;
    });
  }

  void _updateScreen(ScreenState newState) {
    setState(() {
      _currentScreen = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget displayedWidget;

    switch (_currentScreen) {
      case ScreenState.welcome:
        displayedWidget = WelcomeScreen(
          onStartQuiz: () => _updateScreen(ScreenState.question),
        );
        break;

      case ScreenState.question:
        final currentQuestion = _questions[_currentQuestionIndex];
        displayedWidget = QuestionScreen(
          question: currentQuestion['question'],
          choices: List<String>.from(currentQuestion['choices']),
          onNextQuestion: _nextQuestion,
        );
        break;

      case ScreenState.result:
        displayedWidget = ResultScreen(
          score: _submission.calculateScore(
              _questions.map((q) => q['correctAnswer'] as String).toList()),
          onRestartQuiz: _restartQuiz,
        );
        break;

      default:
        displayedWidget = Center(child: Text("Unknown State"));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Quiz App')),
      body: displayedWidget,
    );
  }
}
