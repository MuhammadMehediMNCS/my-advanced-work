import 'package:flutter/material.dart';

class GridStorage extends StatelessWidget {
  const GridStorage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StoreKeyGrid(),
    );
  }
}

class StoreKeyGrid extends StatefulWidget {
  const StoreKeyGrid({Key? key}) : super(key: key);

  @override
  State<StoreKeyGrid> createState() => _StoreKeyGridState();
}

class _StoreKeyGridState extends State<StoreKeyGrid> {
  int selecetedIndex = 0;
  final pages = [
    const buildGPageOne(),
    const buildGPageTwo()
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selecetedIndex,
        onTap: (index) => setState(() {selecetedIndex = index;}),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.close, size: 28,),
            label: 'GridView'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28,),
            label: 'Key GridView'
          )
        ]
      ),
      body: pages [selecetedIndex],
  );
}

class buildGPageOne extends StatefulWidget {
  const buildGPageOne({Key? key}) : super(key: key);

  @override
  State<buildGPageOne> createState() => _buildGPageOneState();
}

class _buildGPageOneState extends State<buildGPageOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          key: const PageStorageKey<String>('pageOne'),
          itemCount: 40,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        itemBuilder: (context, index) => GridTile(
          child: Center(
            child: Text(
              'Grid item ${index +1}',
              style: const TextStyle(fontSize: 24),
            ),
          )
        )
      ),
    );
  }
}

class buildGPageTwo extends StatefulWidget {
  const buildGPageTwo({Key? key}) : super(key: key);

  @override
  State<buildGPageTwo> createState() => _buildGPageTwoState();
}

class _buildGPageTwoState extends State<buildGPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 40,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        itemBuilder: (context, index) => GridTile(
          child: Center(
            child: Text(
              'Grid item ${index +1}',
              style: const TextStyle(fontSize: 24),
            ),
          )
        )
      ),
    );
  }
}