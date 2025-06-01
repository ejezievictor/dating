import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dating/main.dart';
import 'package:dating/providers/navigation_provider.dart';
import 'package:dating/providers/questions_provider.dart';

void main() {
  testWidgets('App loads with bottom navigation', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Verify that the app loads with the main navigation
    expect(find.text('Stroll Bonfire'), findsOneWidget);

    // Verify bottom navigation tabs are present
    expect(find.byIcon(Icons.local_fire_department), findsOneWidget);
    expect(find.byIcon(Icons.explore), findsOneWidget);
    expect(find.byIcon(Icons.chat_bubble_outline), findsOneWidget);
    expect(find.byIcon(Icons.person_outline), findsOneWidget);
  });

  testWidgets('Bottom navigation switches screens',
      (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    // Tap on discover tab
    await tester.tap(find.byIcon(Icons.explore));
    await tester.pump();

    // Verify we're on the discover screen
    expect(find.text('Discover'), findsOneWidget);
    expect(find.text('Find new connections'), findsOneWidget);

    // Tap on messages tab
    await tester.tap(find.byIcon(Icons.chat_bubble_outline));
    await tester.pump();

    // Verify we're on the messages screen
    expect(find.text('Messages'), findsOneWidget);
    expect(find.text('Your conversations'), findsOneWidget);

    // Tap on profile tab
    await tester.tap(find.byIcon(Icons.person_outline));
    await tester.pump();

    // Verify we're on the profile screen
    expect(find.text('Angelina, 28'), findsOneWidget);
  });

  test('Navigation provider manages state correctly', () {
    final container = ProviderContainer();

    // Initial state should be 0 (first tab)
    expect(container.read(bottomNavigationProvider), 0);

    // Change to second tab
    container.read(bottomNavigationProvider.notifier).state = 1;
    expect(container.read(bottomNavigationProvider), 1);

    // Change to third tab
    container.read(bottomNavigationProvider.notifier).state = 2;
    expect(container.read(bottomNavigationProvider), 2);

    container.dispose();
  });

  test('Questions provider provides mock data', () {
    final container = ProviderContainer();

    final questions = container.read(questionsProvider);

    // Should have mock questions
    expect(questions.length, greaterThan(0));
    expect(questions.first.text, contains('favorite time'));
    expect(questions.first.options.length, 4);

    container.dispose();
  });
}
