import 'package:flutter/material.dart';
import 'package:some_advanced/show_or_hide_app_and_tab/page_tab_bar.dart';
import 'page_navigation_drawer.dart';
import 'page_pop_up_menu.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const TabApp()
    );
  }
}

class TabApp extends StatefulWidget {
  const TabApp({Key? key}) : super(key: key);

  @override
  State<TabApp> createState() => _TabAppState();
}

class _TabAppState extends State<TabApp> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPages(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Text('AppBar'),
            label: 'AppBar',
            activeIcon: Text('.............')
          ),
          BottomNavigationBarItem(
            icon: Text('TabBar'),
            label: 'TabBar',
            activeIcon: Text('.............')
          ),
          BottomNavigationBarItem(
            icon: Text('Both'),
            label: 'Both',
            activeIcon: Text('.............')
          )
        ],
        onTap: (int index) => setState(() => this.index = index),
      ),
    );
  }

  Widget buildPages() {
    switch(index) {
      case 0:
        return const TabBarPage();
      case 1:
        return const PopUpMenuPage();
      case 2:
        return const NavigationDrawerPage();
      default:
        return Container();
    }
  }
}