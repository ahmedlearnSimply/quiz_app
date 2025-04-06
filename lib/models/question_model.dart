class QuestionModel {
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  QuestionModel({
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });
}
