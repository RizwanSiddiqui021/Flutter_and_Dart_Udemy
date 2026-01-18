import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  testWidgets('Quiz app loads', (WidgetTester tester) async {
    // Build the app
    await tester.pumpWidget(Quiz());

    // Example check (adjust based on your UI)
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
