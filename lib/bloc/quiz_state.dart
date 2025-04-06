import 'package:quiz_app/models/question_model.dart';

class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoaded extends QuizState {
  final List<QuestionModel> questions;
  final int currentQuestionIndex;
  final int score;
  final bool isAnswered;
  final int? selectedAnswerIndex;

  QuizLoaded({
    required this.questions,
    required this.currentQuestionIndex,
    required this.score,
    required this.isAnswered,
    this.selectedAnswerIndex,
  });
}

class QuizFinished extends QuizState {
  final int score;
  final int totalQuestions;
  QuizFinished({required this.score, required this.totalQuestions});
}
