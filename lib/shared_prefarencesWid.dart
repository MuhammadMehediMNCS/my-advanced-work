import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExampleSharedWidget extends StatelessWidget {
  static const String title = 'Shared Prefarences';

  const ExampleSharedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: const PreferencesExample(title: title),
    );
  }
}

class PreferencesExample extends StatefulWidget {
  final String title;

  const PreferencesExample({super.key, required this.title});

  @override
  State<PreferencesExample> createState() => _PreferencesExampleState();
}

class _PreferencesExampleState extends State<PreferencesExample> {
  int counter = 0;

  loadCounter() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      counter = pref.getInt("Counter") ?? 0;
    });
  }

  increment() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      counter++;
      pref.setInt("Counter", counter);
    });
  }

  @override
  void initState() {
    super.initState();
    loadCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You Have Pressed $counter',
                style: const TextStyle(fontSize: 35),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}