import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/bloc/quiz_event.dart';
import 'package:quiz_app/bloc/quiz_state.dart';
import 'package:quiz_app/models/question_model.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    //? 1. Load Questions
    on<LoadQuestionsEvent>(
      (event, emit) {
        final questions = [
          QuestionModel(
            question: "What is the capital of Egypt?",
            options: ["Cairo", "Alexandria", "Giza", "Luxor"],
            correctOptionIndex: 0,
          ),
          QuestionModel(
            question: "Which language does Flutter use?",
            options: ["Java", "Kotlin", "Dart", "Swift"],
            correctOptionIndex: 2,
          ),
        ];
        emit(QuizLoaded(
          questions: questions,
          currentQuestionIndex: 0,
          score: 0,
          isAnswered: false,
          selectedAnswerIndex: null,
        ));
      },
    );
    //? 2. submit Questions
    on<SubmitAnswerEvent>((event, emit) {
      if (state is QuizLoaded) {
        final currentState = state as QuizLoaded;
        final currentQuestion =
            currentState.questions[currentState.currentQuestionIndex];

        final isCorrect =
            event.selectedIndex == currentQuestion.correctOptionIndex;
        final newScore =
            isCorrect ? currentState.score + 1 : currentState.score;
        emit(QuizLoaded(
          questions: currentState.questions,
          currentQuestionIndex: currentState.currentQuestionIndex,
          score: newScore,
          isAnswered: true,
          selectedAnswerIndex: event.selectedIndex,
        ));
      }
    });
    //? 3. next Question
    on<NextQuestionEvent>((event, emit) {
      final currentState = state as QuizLoaded;
      final nextIndex = currentState.currentQuestionIndex + 1;
      if (state is QuizLoaded) {
        emit(QuizLoaded(
          questions: currentState.questions,
          currentQuestionIndex: currentState.currentQuestionIndex + 1,
          score: currentState.score,
          isAnswered: false,
          selectedAnswerIndex: null,
        ));
      } else {
        emit(QuizFinished(
          score: currentState.score,
          totalQuestions: currentState.questions.length,
        ));
      }
    });
  }
}
