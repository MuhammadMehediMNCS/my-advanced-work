import 'package:flutter/material.dart';

class AppBarPage extends StatefulWidget {
  const AppBarPage({Key? key}) : super(key: key);

  @override
  State<AppBarPage> createState() => _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: NestedScrollView(
      //floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const SliverAppBar(
          floating: true,
          snap: true,
          //expandedHeight: 240,
          // flexibleSpace: FlexibleSpaceBar(
          //   title: const Text('Sliver AppBar'),
          //   background: Image.network(
          //     'src',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          title: Text('AppBar'),
          centerTitle: true,
        ),
      ],
    body: ListView.separated(
      padding: const EdgeInsets.all(12),
      itemBuilder: (context, index) => buildCard(index + 1),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: 35
    ),
  ));

  Widget buildCard(int sum) => Card(
    elevation: 2,
    margin: EdgeInsets.zero,
    child: Text('Item $sum'),
  );
}