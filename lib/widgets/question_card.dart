import 'package:dating/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/question.dart';
import '../providers/navigation_provider.dart';
import '../providers/user_provider.dart';
import '../utils/theme_utils.dart';
import '../utils/app_localizations.dart';

class QuestionCard extends ConsumerWidget {
  final Question question;

  const QuestionCard({
    super.key,
    required this.question,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAnswers = ref.watch(selectedAnswersProvider);
    final currentUser = ref.watch(currentUserProvider);

    return Column(
      children: [
        _buildQuestionHeader(currentUser),
        const SizedBox(height: 5),
        _buildQuestionSubtitle(),
        const SizedBox(height: 8),
        _buildAnswerGrid(context, ref, selectedAnswers[question.id]),
        const SizedBox(height: 12),
        _buildBottomControls(ref, context),
        const SizedBox(height: 20),
      ],
    );
  }

  // Question header with user profile and question text
  Widget _buildQuestionHeader(dynamic currentUser) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildUserAvatar(),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${currentUser.name}, ${currentUser.age}',
                  style: AppTheme.smallTextStyle,
                ),
                const SizedBox(height: 8),
                _buildQuestionText(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // User avatar with border
  Widget _buildUserAvatar() {
    return Container(
      decoration: AppTheme.circleAvatarDecoration,
      child: ClipOval(
        child: Container(
          width: 44,
          height: 44,
          color: Colors.grey.shade800,
          child: Image.asset(
            Assets.profile,
            width: 44,
            height: 44,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // Question text display
  Widget _buildQuestionText() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        question.text,
        style: AppTheme.headingStyle,
        softWrap: true,
        overflow: TextOverflow.visible,
        maxLines: 5,
      ),
    );
  }

  // Question subtitle
  Widget _buildQuestionSubtitle() {
    return Container(
      width: 344,
      height: 20,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Text(
          question.subtitle,
          style: AppTheme.subtitleStyle,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  // 2x2 grid of answer options
  Widget _buildAnswerGrid(
      BuildContext context, WidgetRef ref, String? selectedAnswerId) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildGridOptionButton(context, ref, question.options[0],
                  selectedAnswerId == question.options[0].id),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildGridOptionButton(context, ref, question.options[1],
                  selectedAnswerId == question.options[1].id),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildGridOptionButton(context, ref, question.options[2],
                  selectedAnswerId == question.options[2].id),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildGridOptionButton(context, ref, question.options[3],
                  selectedAnswerId == question.options[3].id),
            ),
          ],
        ),
      ],
    );
  }

  // Individual answer option button
  Widget _buildGridOptionButton(BuildContext context, WidgetRef ref,
      QuestionOption option, bool isSelected) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _selectAnswer(ref, option.id),
        child: Container(
          width: 166,
          height: 57,
          padding: const EdgeInsets.all(12),
          decoration: isSelected
              ? AppTheme.selectedCardDecoration
              : AppTheme.cardDecoration,
          child: Row(
            children: [
              _buildOptionLabel(option.label, isSelected),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  option.text,
                  style:
                      isSelected ? AppTheme.bodyBoldStyle : AppTheme.bodyStyle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Option label circle (A, B, C, D)
  Widget _buildOptionLabel(String label, bool isSelected) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryColor : Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppTheme.primaryColor : AppTheme.textPrimaryColor,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: AppTheme.labelStyle,
        ),
      ),
    );
  }

  // Bottom controls with helper text and action buttons
  Widget _buildBottomControls(WidgetRef ref, BuildContext context) {
    final localizations = AppLocalizations.fromRef(ref, context);

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localizations.pickYourOption,
                style: AppTheme.helperTextStyle,
              ),
              Text(
                localizations.seeWhoHasSimilarMind,
                style: AppTheme.helperTextStyle.copyWith(
                  color: AppTheme.textPrimaryColor,
                ),
              ),
            ],
          ),
        ),
        _buildActionButtons(ref),
      ],
    );
  }

  // Action buttons (mich and poll)
  Widget _buildActionButtons(WidgetRef ref) {
    return Row(
      children: [
        _buildActionButton(
          Assets.mich,
          () {}, // Empty callback for mich button
        ),
        const SizedBox(width: 12),
        _buildActionButton(
          Assets.pollAct,
          () => _nextQuestion(ref),
        ),
      ],
    );
  }

  // Individual action button
  Widget _buildActionButton(String svgPath, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          svgPath,
          width: 48,
          height: 48,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Helper methods
  void _selectAnswer(WidgetRef ref, String optionId) {
    final currentAnswers = ref.read(selectedAnswersProvider);
    ref.read(selectedAnswersProvider.notifier).state = {
      ...currentAnswers,
      question.id: optionId,
    };
  }

  void _nextQuestion(WidgetRef ref) {
    final currentIndex = ref.read(currentQuestionProvider);
    ref.read(currentQuestionProvider.notifier).state = currentIndex + 1;
  }
}
