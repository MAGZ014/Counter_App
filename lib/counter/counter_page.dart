import 'package:primer_aappa_hector/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "CONTADOR...",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (context.read<CounterCubit>().state < 10) {
                    context.read<CounterCubit>().increment();
                  } else {
                    Fluttertoast.showToast(
                        msg: "El contador llego a 10 (Limite)");
                  }
                },
                child: const Icon(Icons.add)),
            const SizedBox(
              height: 4,
            ),
            const CounterText(),
            const SizedBox(
              height: 4,
            ),
            ElevatedButton(
                onPressed: () {
                  if (context.read<CounterCubit>().state > -10) {
                    context.read<CounterCubit>().decrement();
                  } else {
                    Fluttertoast.showToast(
                        msg: "El contador llego a -10 (Limite)");
                  }
                },
                child: const Icon(Icons.remove)),
            const SizedBox(
              height: 4,
            ),
            ElevatedButton(
                onPressed: () => context.read<CounterCubit>().reset(),
                child: const Icon(Icons.refresh)),
          ],
        ),
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({super.key});

 @override
  Widget build(BuildContext context) {
    final count = context.select((CounterCubit cubit) => cubit.state);
    return Text(
      '$count',
      style: TextStyle(
        fontSize: 35, // Tamaño de fuente del contador
        color: Color.fromARGB(255, 79, 76, 255),
      ),
    );
  }
}