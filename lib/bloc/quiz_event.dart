class QuizEvent {}

class LoadQuestionsEvent extends QuizEvent {}

class SubmitAnswerEvent extends QuizEvent {
  final int selectedIndex;
  SubmitAnswerEvent(this.selectedIndex);
}

class NextQuestionEvent extends QuizEvent {}
