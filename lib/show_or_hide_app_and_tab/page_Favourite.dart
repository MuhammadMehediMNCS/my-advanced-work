import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(children: []),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Favourite Page'),
        centerTitle: true,
      ),
    );
  }
}