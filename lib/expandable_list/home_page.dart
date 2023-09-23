import 'package:flutter/material.dart';
import 'basic_tile.dart';

class ExpandableListPage extends StatefulWidget {
  const ExpandableListPage({Key? key}) : super(key: key);

  @override
  State<ExpandableListPage> createState() => _ExpandableListPageState();
}

class _ExpandableListPageState extends State<ExpandableListPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expandable List'),
          centerTitle: true,
        ),
        body: ListView(
          children: basicTile.map(buildTile).toList(),
        ),
      ),
    );
  }

  Widget buildTile(BasicTile tile, {double leftPadding = 16}) {
    if (tile.tiles.isEmpty) {
      return ListTile(
        contentPadding: EdgeInsets.only(left: leftPadding),
        title: Text(tile.title),
      );
    } else {
      return ExpansionTile(
        tilePadding: EdgeInsets.only(left: leftPadding),
        trailing: const SizedBox.shrink(),
        leading: const Icon(Icons.keyboard_arrow_right_outlined),
        title: Text(tile.title),
        children: tile.tiles.map((tile) => buildTile(tile, leftPadding: 16 + leftPadding)).toList()
      );
    }
  }
}