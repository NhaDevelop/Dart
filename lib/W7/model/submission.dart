class Submission {
  List<String> answers;
  String userAnswer; 

  Submission({required this.answers, required this.userAnswer});

 
  void reset() {
    answers.clear();
    userAnswer = '';
  }

 
  int calculateScore(List<String> correctAnswers) {
    int score = 0;
    for (int i = 0; i < answers.length; i++) {
      if (i < correctAnswers.length && answers[i] == correctAnswers[i]) {
        score++;
      }
    }
    return score;
  }
}
