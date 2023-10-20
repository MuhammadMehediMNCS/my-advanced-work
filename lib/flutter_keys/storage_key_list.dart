import 'package:flutter/material.dart';


class ListStorage extends StatelessWidget {
  const ListStorage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StoreKeyList(),
    );
  }
}

class StoreKeyList extends StatefulWidget {
  const StoreKeyList({Key? key}) : super(key: key);

  @override
  State<StoreKeyList> createState() => _StoreKeyListState();
}

class _StoreKeyListState extends State<StoreKeyList> {
  int selecetedIndex = 0;

  final pages = [
    const buildPageOne(),
    const buildPageTwo()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selecetedIndex,
        onTap: (index) => setState(() {selecetedIndex = index;}),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.close, size: 28,),
            label: 'ListView'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28,),
            label: 'Key ListView'
          )
        ]
      ),
      body: pages [selecetedIndex],
    );
  }
}

class buildPageOne extends StatefulWidget {
  const buildPageOne({Key? key}) : super(key: key);

  @override
  State<buildPageOne> createState() => _buildPageOneState();
}

class _buildPageOneState extends State<buildPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          key: const PageStorageKey<String>('pageTow'), // It use only for local, like TabBar, NavBar.
          itemCount: 40,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            'List item ${index +1}',
            style: const TextStyle(fontSize: 24),
          ),
        )
      ),
    );
  }
}

class buildPageTwo extends StatefulWidget {
  const buildPageTwo({Key? key}) : super(key: key);

  @override
  State<buildPageTwo> createState() => _buildPageTwoState();
}

class _buildPageTwoState extends State<buildPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
            itemCount: 40,
            itemBuilder: (context, index) => ListTile(
          title: Text(
            'List item ${index +1}',
            style: const TextStyle(fontSize: 24),
          ),
        )
      ),
    );
  }
}