import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 4,
    child: Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverSafeArea(
              top: false,
              sliver: SliverAppBar(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                forceElevated: innerBoxIsScrolled,
                //pinned: true,
                floating: true,
                snap: true,
                title: const Text('TabBar', style: TextStyle(color: Colors.black),),
                centerTitle: true,
                bottom: const TabBar(
                  indicatorColor: Colors.white,
                  indicatorWeight: 5,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.home),
                      text: 'Home',
                    ),
                    Tab(
                      //icon: Icon(Icons.list_alt),
                      text: 'Feed',
                    ),
                    Tab(
                      icon: Icon(Icons.person),
                      text: 'Profile',
                    ),
                    Tab(
                      icon: Icon(Icons.settings),
                      text: 'Settings',
                    )
                  ]
                ),
              ),
            ),
          ),
        ],
        body: TabBarView(
          children: [
            buildTabPage('Home Page'),
            buildTabPage('Feed Page'),
            buildTabPage('Profile Page'),
            buildTabPage('Settings Page')
          ]
        )
      )
    ),
  );

  Widget buildTabPage(String text) => SafeArea(
    top: false,
    bottom: false,
    child: Builder(
      builder: (context) => CustomScrollView(
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)
          ),
          SliverPadding(
            padding: const EdgeInsets.all(12.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  const childCount = 25;
                  final hasSeparator = index != childCount -1;
                  final double bottom = hasSeparator ? 12 : 0;
                  final child = buildCard(index + 1);
  
                  return Container(
                    margin: EdgeInsets.only(bottom: bottom),
                    child: child,
                  );
                },
                childCount: 25,
              )
            ),
          )
        ],
      )
    ),
  );

  Widget buildCard(int sum) => Card(
    elevation: 2,
    margin: EdgeInsets.zero,
    child: Text('Item $sum'),
  );
}