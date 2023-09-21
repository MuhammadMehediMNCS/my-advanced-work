import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'on_bording_dot.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('showHome', false);

              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnBScreen(title: 'title')));
            },
            icon: Icon(Icons.logout)
          )
        ],
      ),
      body: const Center(
        child: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 35),
        ),
      ),
    );
  }
}