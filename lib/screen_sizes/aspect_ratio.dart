import 'package:flutter/material.dart';

class MyAspect extends StatelessWidget {
  const MyAspect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Aspect Ratio'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.blue,
                  child: Image.asset(
                    'images/Penguin.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 4 / 8,
                child: Image.asset('images/Lodu.png'),
              )
            ],
          ),
        ),
      ));
}