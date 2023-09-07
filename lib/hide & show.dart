import 'package:flutter/material.dart';

class Show_Hide extends StatelessWidget {
  const Show_Hide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Hide(),
    );
  }
}

class Hide extends StatefulWidget {
  const Hide({Key? key}) : super(key: key);

  @override
  State<Hide> createState() => _HideState();
}

class _HideState extends State<Hide> {
  bool isVisible = false;
  
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Hide or Show Widget'),
      centerTitle: true,
      actions: [ isVisible == true
        ? IconButton(
          icon: const Icon(Icons.visibility_outlined),
          onPressed: () => setState(() {isVisible = false;}),
        ) : IconButton(
          icon: const Icon(Icons.visibility_off_outlined),
          onPressed: () => setState(() {isVisible = true;}),
        )
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: ListView(
          children: [
            if(isVisible)
            Image.asset(
              'images/butterfly.jpg',
              height: 400,
              fit: BoxFit.cover,
            ),
            const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do elusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(fontSize: 24),
            )
          ],
        )
        
        // Visibility(
        //   visible: true,
        //   child: Image.asset(
        //     'name',
        //     height: 400,
        //     fit: BoxFit.cover,
        //   )
        // ),
      ),
    ),
  );
}