import 'package:flutter/material.dart';

class ExpandedvsFlexible extends StatelessWidget {
  const ExpandedvsFlexible({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFlex(),
    );
  }
}

// Flexible Only take full width and typed full height, but not all full space.

class MyFlex extends StatefulWidget {
  const MyFlex({Key? key}) : super(key: key);

  @override
  State<MyFlex> createState() => _MyFlexState();
}

class _MyFlexState extends State<MyFlex> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Flexible'),
      centerTitle: true,
    ),
    body: Column(
      children: [
        Flexible(
          child: Container(
            height: 200,
            color: Colors.red,
            child: const Center(child: Text('200')),
          ),
        ),
        Container(
          height: 450,
          color: Colors.blue,
          child: const Center(child: Text('200')),
        )
      ],
    ),
  );
}

// Expanded take all full space.

class MyExpan extends StatefulWidget {
  const MyExpan({Key? key}) : super(key: key);

  @override
  State<MyExpan> createState() => _MyExpanState();
}

class _MyExpanState extends State<MyExpan> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Expanded'),
      centerTitle: true,
    ),
    body: Column(
      children: [
        Container(
          height: 200,
          color: Colors.red,
          child: const Center(child: Text('200')),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 200,
            color: Colors.green,
            child: const Center(child: Text('200')),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
              height: 100,
              color: Colors.blue,
              child: const Center(child: Text('200')),
            ),
        ),
      ],
    ),
  );
}