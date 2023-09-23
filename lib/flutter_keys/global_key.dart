import 'package:flutter/material.dart';

class BasicKey extends StatelessWidget {
  final keyConter = GlobalKey<_CounterWidgetState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Global Key'),
          centerTitle: true,
        ),
        body: Center(
          child: CounterWidget(key: keyConter)
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            final state = keyConter.currentState!;

            state.increment();

            print(state.counter);
          }
        ),
      )
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  void increment() => setState(() {
    counter += 5;
  });

  @override
  Widget build(BuildContext context) => Text(
    'Counter: $counter',
    style: const TextStyle(fontSize: 32),
  );
}