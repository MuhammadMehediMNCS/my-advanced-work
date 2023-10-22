import 'package:flutter/material.dart';

class DesignMaterial extends StatelessWidget {
  static const String title = 'Material NavigationBar';

  const DesignMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.brown
      ),
      home: const BNBar(title: title),
    );
  }
}

class BNBar extends StatefulWidget {
  final String title;

  const BNBar({Key? key, required this.title}) : super(key: key);

  @override
  State<BNBar> createState() => _BNBarState();
}

class _BNBarState extends State<BNBar> {
  int index = 0;
  final screens = [
    const Center(child: Text('Mail', style: TextStyle(fontSize: 72))),
    const Center(child: Text('Chat', style: TextStyle(fontSize: 72))),
    const Center(child: Text('Spaces', style: TextStyle(fontSize: 72))),
    const Center(child: Text('Meet', style: TextStyle(fontSize: 72)))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)
          )
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: const Color(0xFFf1f5fb),
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          animationDuration: const Duration(seconds: 3),
          //labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.email_outlined),
              selectedIcon: Icon(Icons.email),
              label: 'Mail',
            ),
            NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline),
              selectedIcon: Icon(Icons.chat_bubble),
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(Icons.group_outlined),
              selectedIcon: Icon(Icons.group),
              label: 'Spaces',
            ),
            NavigationDestination(
              icon: Icon(Icons.videocam_outlined, size: 30,),
              selectedIcon: Icon(Icons.videocam, size: 30,),
              label: 'Meet',
            ),
          ]
        ),
      ),
      body: screens[index],
    );
  }
}