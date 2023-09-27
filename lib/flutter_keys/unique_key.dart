import 'dart:math';

import 'package:flutter/material.dart';

class UniquePage extends StatelessWidget {
  const UniquePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: My_Unique_Key(),
    );
  }
}

class MyUnique extends StatefulWidget {
  const MyUnique({Key? key}) : super(key: key);

  @override
  State<MyUnique> createState() => _MyUniqueState();
}

class _MyUniqueState extends State<MyUnique> {
  late List<Widget> children;

  @override
  void initState() {
    super.initState();

    children = [
      const ColorStateWidget(text: '1'),
      const ColorStateWidget(text: '2')
    ];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Unique Key'),
      centerTitle: true,
    ),
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: swapTiles,
      child: const Icon(Icons.swap_horiz, size: 32)
    ),
  );

  void swapTiles() => setState(() {
    final child = children.removeAt(0);
    children.insert(1, child);
  });
}


class My_Unique_Key extends StatefulWidget {
  const My_Unique_Key({Key? key}) : super(key: key);

  @override
  State<My_Unique_Key> createState() => _My_Unique_KeyState();
}

class _My_Unique_KeyState extends State<My_Unique_Key> {
  late List<Widget> children;

  @override
  void initState() {
    super.initState();

    children = [
      Container(child: ColorStateWidget(key: UniqueKey(), text: '1')),
      Container(child: ColorStateWidget(key: UniqueKey(), text: '2'))

      // ValueKey needs value: (0, 1, 2... Type same value get error) but UniqueKey don't need values.

      // Container(key: UniqueKey(), child: ColorStateWidget(text: '3')),
      // Container(key: UniqueKey(), child: ColorStateWidget(text: '4'))
      // Or
      // ColorStateWidget(key: UniqueKey(), text: '5'),
      // ColorStateWidget(key: UniqueKey(), text: '5')
    ];
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Unique Key'),
      centerTitle: true,
    ),
    body: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: swapTiles,
      child: const Icon(Icons.swap_horiz, size: 32)
    ),
  );

  void swapTiles() => setState(() {
    final child = children.removeAt(0);
    children.insert(1, child);
  });
}


class ColorStateWidget extends StatefulWidget {
  final String text;

  const ColorStateWidget({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  State<ColorStateWidget> createState() => _ColorStateWidgetState();
}

class _ColorStateWidgetState extends State<ColorStateWidget> {
  late Color color;

  @override
  void initState() {
    super.initState();

    color = generateColor();
  }

  Color generateColor() {
    final random = Random();

    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255)
    );
  }
  @override
  Widget build(BuildContext context) => Container(
    color: color,
    width: 150,
    height: 150,
    child: Center(
      child: Text(
        widget.text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold
        ),
      ),
    ),
  );
}