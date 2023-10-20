import 'package:flutter/material.dart';

import '../expandable_list/basic_tile.dart';

class ExpantionStorage extends StatelessWidget {
  const ExpantionStorage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: StoreKeyExpantion(),
   ); 
  }
}

class StoreKeyExpantion extends StatefulWidget {
  const StoreKeyExpantion({Key? key}) : super(key: key);

  @override
  State<StoreKeyExpantion> createState() => _StoreKeyExpantionState();
}

class _StoreKeyExpantionState extends State<StoreKeyExpantion> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 2,
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Page Storage Key'),
        bottom: const TabBar(tabs: [
          Tab(icon: Icon(Icons.home), text: 'Home',),
          Tab(icon: Icon(Icons.settings), text: 'Settings',)
        ]),
      ),
      body: TabBarView(
        children: [
          buildEPageOne(),
          buildEPageTwo()
        ]
      ),
    )
  );

  Widget buildEPageOne() => ListView(
    key: const PageStorageKey<String>('pageOne'),
    children: basicTile.map(buildTile).toList(),
  );

  Widget buildEPageTwo() => ListView(
    children: basicTile.map(buildTile).toList(),
  );

  Widget buildTile(BasicTile tile, {double leftPadding = 16}) {
    if (tile.tiles.isEmpty) {
      return ListTile(
        contentPadding: EdgeInsets.only(left: leftPadding),
        title: Text(tile.title),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Colors.red)
        ),
        child: ExpansionTile(
          key: PageStorageKey(tile.title),
          tilePadding: EdgeInsets.only(left: leftPadding),
          trailing: const SizedBox.shrink(),
          leading: const Icon(Icons.keyboard_arrow_right_outlined),
          title: Text(tile.title),
          children: tile.tiles.map((tile) => buildTile(tile, leftPadding: 16 + leftPadding)).toList()
        ),
      );
    }
  }
}