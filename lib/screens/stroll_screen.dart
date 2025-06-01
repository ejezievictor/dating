import 'package:dating/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/questions_provider.dart';
import '../providers/user_provider.dart';
import '../widgets/question_card.dart';
import '../utils/app_localizations.dart';

class StrollScreen extends ConsumerWidget {
  const StrollScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentQuestion = ref.watch(currentQuestionDataProvider);
    final currentUser = ref.watch(currentUserProvider);
    final localizations = AppLocalizations.fromRef(ref, context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets.background,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withValues(alpha: 0.3),
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          localizations.strollBonfire,
                          style: TextStyle(
                            color: Color(0xFFB3ADF6),
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                            shadows: [
                              Shadow(
                                color: Color(0x33000000),
                                offset: Offset(0, 0),
                                blurRadius: 7.9,
                              ),
                              Shadow(
                                color: Color(0xFFBEBEBE),
                                offset: Offset(0, 0),
                                blurRadius: 2,
                              ),
                              Shadow(
                                color: Color(0x8024232F),
                                offset: Offset(0, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 2),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xFFB3ADF6),
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                Assets.clock,
                                width: 14,
                                height: 14,
                                colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.9),
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                localizations.formatTimeRemaining(22, 0),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Proxima Nova',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.0,
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 2),

                        // User count
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                Assets.user,
                                width: 14,
                                height: 20,
                                colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(0.9),
                                  BlendMode.srcIn,
                                ),
                              ),
                              Text(
                                '103',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontFamily: 'Proxima Nova',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  height: 1.0,
                                  letterSpacing: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.85),
                          Colors.black,
                        ],
                        stops: const [0.0, 0.1, 1.0],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: currentQuestion != null
                          ? QuestionCard(question: currentQuestion)
                          : Center(
                              child: Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Text(
                                  localizations.noMoreQuestions,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
