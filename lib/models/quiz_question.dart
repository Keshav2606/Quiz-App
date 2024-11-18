class QuizQuestion {
  const QuizQuestion(
      {required this.question, required this.options, required this.answer});

  final String question;
  final List<String> options;
  final String answer;

  List<String> getShuffledOptions() {
    final List<String> shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
