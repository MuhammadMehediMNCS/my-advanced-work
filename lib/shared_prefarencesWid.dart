import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExampleSharedP extends StatelessWidget {
  static const String title = 'Shared Prefarences';

  const ExampleSharedP({super.key});

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
  int Counter = 0;

  loadCounter() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      Counter = pref.getInt("Counter") ?? 0;
    });
  }

  increment() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      Counter++;
      pref.setInt("Counter", Counter);
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
                'You Have Pressed $Counter',
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