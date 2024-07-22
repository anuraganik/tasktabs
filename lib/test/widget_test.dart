import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tasktabs/main.dart';

void main() {
  testWidgets('Home screen displays welcome message', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the home screen displays the welcome message.
    expect(find.text('Welcome to TaskTabs'), findsOneWidget);
  });
}

