import 'package:flutter/material.dart';
import 'package:flutter_counter/app.dart';
import 'package:flutter_counter/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterApp', () {
    testWidgets('is a MaterialApp', (widgetTester) async {
      expect(const CounterApp(), isA<MaterialApp>());
    });

    testWidgets('home is a CounterPage', (widgetTester) async {
      expect(const CounterApp().home, isA<CounterPage>());
    });

    testWidgets('renders CounterPage', (widgetTester) async {
      await widgetTester.pumpWidget(const CounterApp());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
