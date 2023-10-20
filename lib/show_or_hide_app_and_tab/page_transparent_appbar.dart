import 'package:flutter/material.dart';

class TransparentAppBar extends StatefulWidget {
  const TransparentAppBar({Key? key}) : super(key: key);

  @override
  State<TransparentAppBar> createState() => _TransparentAppBarState();
}

class _TransparentAppBarState extends State<TransparentAppBar> {
  @override
  Widget build(BuildContext context) => Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(
      title: const Text('Transparent AppBar'),
      centerTitle: true,
      leading: const BackButton(),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        )
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    body: Image.asset(
      'Assets/car.jpg',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ),
  );
}