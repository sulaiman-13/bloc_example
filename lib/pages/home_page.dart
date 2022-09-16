import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('bloc example')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Counter value : "),
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  if (state is CounterValueChange) {
                    return Text(state.counter.toString());
                  }
                  if (state is CounterInitial) {
                    return Text(state.counter.toString());
                  }
                  return const Text('faild');
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _floatingWidget(context),
    );
  }

  Widget _floatingWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(CounterIncrease());
          },
          child: const Text('+'),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(CounterReset());
          },
          child: const Text('0'),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(CounterDecrease());
          },
          child: const Text('-'),
        )
      ],
    );
  }
}
