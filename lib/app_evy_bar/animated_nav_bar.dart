import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import '../flutter_nav_and_route/home_page.dart';

class AnimatedNavBar extends StatelessWidget {
  static const String title = 'Animated Bottom Navy Bar';

  const AnimatedNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.blue.shade200
      ),
      home: const ABNBar(title: title),
    );
  }
}

class ABNBar extends StatefulWidget {
  final String title;

  const ABNBar({super.key, required this.title});

  @override
  State<ABNBar> createState() => _ABNBarState();
}

class _ABNBarState extends State<ABNBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: builBody(),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget builBody() => const Center(
    child: Text(
      'Animated Bottom Navigation',
      style: TextStyle(fontSize: 32),
      textAlign: TextAlign.center,
    ),
  );

  Widget buildPages() {
    switch (index) {
      case 1:
        //return UsersPage();
      case 2:
        //return MessagesPage();
      case 3:
        //return SettingsPage();
      case 0:
      default:
        return const HomePage();
    }
  }

  Widget buildBottomNavigation() {
    const inactiveColor = Colors.grey;

    return BottomNavyBar(
      selectedIndex: index,
      backgroundColor: Colors.black,
      containerHeight: 80,
      //itemCornerRadius: 32,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.apps),
          title: const Text('Home'),
          textAlign: TextAlign.center,
          activeColor: Colors.green,
          inactiveColor: inactiveColor
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.people),
          title: const Text('Users'),
          textAlign: TextAlign.center,
          activeColor: Colors.deepOrangeAccent,
          inactiveColor: inactiveColor
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.message),
          title: const Text('Message'),
          textAlign: TextAlign.center,
          activeColor: Colors.pink,
          inactiveColor: inactiveColor
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.settings),
          title: const Text('Settings'),
          textAlign: TextAlign.center,
          activeColor: Colors.lightBlueAccent,
          inactiveColor: inactiveColor
        )
      ],
      onItemSelected: (index) => setState(() => this.index = index)
    );
  }
}