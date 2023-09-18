import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_counter/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('counter Cubit', () {
    test('initial state is 0', () {
      expect(CounterCubit().state, 0);
    });
  });

  group('increment', () {
    blocTest<CounterCubit, int>(
      'emit[1] when state is 0',
      build: () => CounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => [1],
    );

    blocTest<CounterCubit, int>(
      'emit[45,46,47] when state is 44',
      build: () => CounterCubit(),
      seed: () => 44,
      act: (cubit) => cubit
        ..increment()
        ..increment()
        ..increment(),
      expect: () => [45, 46, 47],
    );
  });

  group('decrement', () {
    blocTest(
      'emit [-1] when state 0',
      build: () => CounterCubit(),
      act: (bloc) => bloc.decrement(),
      expect: () => [-1],
    );

    blocTest(
      'emit [-10,-12] when state -9',
      build: () => CounterCubit(),
      act: (bloc) => bloc
        ..decrement()
        ..decrement(),
      seed: () => -9,
      expect: () => [-1],
    );
  });
}
