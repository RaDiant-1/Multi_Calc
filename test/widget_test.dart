import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator_hub/main.dart';

void main() {
  testWidgets('Tip Calculator calculates correct total per person', (WidgetTester tester) async {
    // Launch the app
    await tester.pumpWidget(CalculatorApp());
    await tester.pumpAndSettle(); // wait for animations to settle

    // Navigate to Tip Calculator
    expect(find.text('Tip Calculator'), findsOneWidget);
    await tester.tap(find.text('Tip Calculator'));
    await tester.pumpAndSettle();

    // Enter bill amount
    await tester.enterText(find.byKey(const Key('billInput')), '100');

    // Enter number of people
    await tester.enterText(find.byKey(const Key('peopleInput')), '4');

    // Select tip percentage (15%)
    await tester.tap(find.text('15%'));
    await tester.pumpAndSettle();

    // Tap Calculate
    await tester.tap(find.text('Calculate'));
    await tester.pumpAndSettle();

    // Verify result
    expect(find.byKey(const Key('resultText')), findsOneWidget);
    expect(find.textContaining('28.75'), findsOneWidget); // $28.75 = (100 + 15) / 4
  });
}
