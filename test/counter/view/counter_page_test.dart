import 'package:flutter/material.dart';
import 'package:flutter_counter/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){


  group('Counter Page', () {

    testWidgets('render counterView', (widgetTester) async{
      await widgetTester.pumpWidget(MaterialApp(home: CounterPage(),));
      expect(find.byType(CounterPage), findsOneWidget);
    });

  }

  );



}