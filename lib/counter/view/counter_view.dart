import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/counter/cubit/counter_cubit.dart';

const incrementButtonKey = Key('counterView_increment_floatingActionButton');
const decrementButtonKey = Key('counterView_decrement_floatingActionButton');

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) => Text(
            '$state',
            style: textTheme.displayMedium,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: incrementButtonKey,
            child: const Icon(Icons.add),
            onPressed: () => CounterCubit.to(context).increment(),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            key: decrementButtonKey,
            child: const Icon(Icons.remove),
            onPressed: () => CounterCubit.to(context).decrement(),
          ),
        ],
      ),
    );
  }
}
