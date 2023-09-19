import 'package:flutter_counter/counter/counter.dart';
import 'package:flutter_counter/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterApp', () {
    testWidgets('render correct AppBar text', (widgetTester) async {
      await widgetTester.pumpApp();
      expect(find.text("Counter"), findsOneWidget);
    });

    testWidgets('render correct initial count', (widgetTester) async {
      await widgetTester.pumpApp();
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('tapping increment button update then count',
        (widgetTester) async {
      await widgetTester.pumpApp();
      expect(find.text('0'), findsOneWidget);

      await widgetTester.incrementCounter();
      expect(find.text('1'), findsOneWidget);

      await widgetTester.incrementCounter();
      expect(find.text('2'), findsOneWidget);

      await widgetTester.incrementCounter();
      expect(find.text('3'), findsOneWidget);
    });

    testWidgets('tapping decrement button update then count',
        (widgetTester) async {
      await widgetTester.pumpApp();
      expect(find.text('0'), findsOneWidget);

      await widgetTester.decrementCounter();
      expect(find.text('-1'), findsOneWidget);

      await widgetTester.decrementCounter();
      expect(find.text('-2'), findsOneWidget);

      await widgetTester.decrementCounter();
      expect(find.text('-3'), findsOneWidget);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpApp() async {
    app.main();
    await pumpAndSettle();
  }

  Future<void> incrementCounter() async {
    await tap(find.byKey(incrementButtonKey));
    await pump();
  }

  Future<void> decrementCounter() async {
    await tap(find.byKey(decrementButtonKey));
    await pump();
  }
}
