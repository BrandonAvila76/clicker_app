import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clicker_app/main.dart';

void main() {
  testWidgets('Minus button decrements counter three times',
      (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify the counter starts at 0.
    final counterFinder = find.byKey(const Key('counterText'));
    expect(tester.widget<Text>(counterFinder).data, '0');

    // Find the "-" button and tap it three times.
    final minusButton = find.widgetWithText(ElevatedButton, '-');
    await tester.tap(minusButton);
    await tester.pump();

    await tester.tap(minusButton);
    await tester.pump();

    await tester.tap(minusButton);
    await tester.pump();

    // Verify the counter is now -3.
    expect(tester.widget<Text>(counterFinder).data, '-3');
  });
}