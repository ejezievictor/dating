class Question {
  final String id;
  final String text;
  final String subtitle;
  final List<QuestionOption> options;
  final String? backgroundImage;

  const Question({
    required this.id,
    required this.text,
    required this.subtitle,
    required this.options,
    this.backgroundImage,
  });
}

class QuestionOption {
  final String id;
  final String text;
  final String label; // A, B, C, D

  const QuestionOption({
    required this.id,
    required this.text,
    required this.label,
  });
}
