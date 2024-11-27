import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled2/main.dart';

void main() {
  group('FunctionCalculator Tests', () {
    test('calculate function works correctly', () {
      final calculator = FunctionCalculator();

      // y = 16 − x + x^3
      expect(calculator.calculate(0), 16);
      expect(calculator.calculate(1), 16);
      expect(calculator.calculate(-1), 18);
      expect(calculator.calculate(3), 40);
    });
  });

  group('UI Tests', () {
    testWidgets('App displays correct title', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.text("KN-32: Julia's last Flutter App"), findsOneWidget);
    });

    testWidgets('FloatingActionButton has correct icon', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      final fab = find.byType(FloatingActionButton);
      expect(fab, findsOneWidget);

      final icon = find.byIcon(Icons.mouse);
      expect(icon, findsOneWidget);
    });

    testWidgets('Counter increments correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.text('0'), findsOneWidget);

      final fab = find.byType(FloatingActionButton);
      await tester.tap(fab);
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
    });
  });
}
