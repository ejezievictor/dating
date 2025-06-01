import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider for managing the current bottom navigation tab index
final bottomNavigationProvider = StateProvider<int>((ref) => 0);

// Provider for managing the current question index in stroll
final currentQuestionProvider = StateProvider<int>((ref) => 0);

// Provider for managing selected answers
final selectedAnswersProvider = StateProvider<Map<String, String>>((ref) => {});
