import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/question.dart';
import 'navigation_provider.dart';

// Mock data for questions
final questionsProvider = Provider<List<Question>>((ref) {
  return [
    Question(
      id: '1',
      text: 'What is your favorite time of the day?',
      subtitle: '"Mine is definitely the peace in the morning."',
      options: [
        QuestionOption(
          id: 'a1',
          text: 'The peace in the early mornings',
          label: 'A',
        ),
        QuestionOption(
          id: 'b1',
          text: 'The magical golden hours',
          label: 'B',
        ),
        QuestionOption(
          id: 'c1',
          text: 'Wind-down time after dinners',
          label: 'C',
        ),
        QuestionOption(
          id: 'd1',
          text: 'The serenity past midnight',
          label: 'D',
        ),
      ],
    ),
    Question(
      id: '2',
      text: 'What\'s your ideal weekend activity?',
      subtitle: '"I love exploring new places and meeting people."',
      options: [
        QuestionOption(
          id: 'a2',
          text: 'Hiking in nature',
          label: 'A',
        ),
        QuestionOption(
          id: 'b2',
          text: 'Reading a good book',
          label: 'B',
        ),
        QuestionOption(
          id: 'c2',
          text: 'Trying new restaurants',
          label: 'C',
        ),
        QuestionOption(
          id: 'd2',
          text: 'Staying home and relaxing',
          label: 'D',
        ),
      ],
    ),
  ];
});

// Provider for the current question
final currentQuestionDataProvider = Provider<Question?>((ref) {
  final questions = ref.watch(questionsProvider);
  final currentIndex = ref.watch(currentQuestionProvider);

  if (currentIndex < questions.length) {
    return questions[currentIndex];
  }
  return null;
});
