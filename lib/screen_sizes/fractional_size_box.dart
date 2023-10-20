import 'package:flutter/material.dart';

class FractionalSize extends StatelessWidget {
  const FractionalSize({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyFractionally(),
    );
  }
}

class MyFractionally extends StatefulWidget {
  const MyFractionally({Key? key}) : super(key: key);

  @override
  State<MyFractionally> createState() => _MyFractionallyState();
}

class _MyFractionallyState extends State<MyFractionally> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Fractionally Sized Box'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 300,
                height: 100,
                color: Colors.red.withOpacity(0.4),
                child: FractionallySizedBox(
                  alignment: Alignment.topCenter,
                  widthFactor: 0.5,
                  heightFactor: 0.8,
                  child: Container(
                    height: 80, // ignor
                    width: 200, // ignor
                    color: Colors.red,
                    child: const Center(
                      child: Text('70%'),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.8,
                heightFactor: 0.5,
                child: Container(
                  color: Colors.red,
                  child: const Center(child: Text('80%, 50%')),
                ),
              ),
            )
          ],
        ),
      ));
}
