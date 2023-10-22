import 'package:flutter/material.dart';

class TabbedAppBar extends StatelessWidget {
  static final String title = 'Tabbed Appbar';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.grey.shade400,
        primarySwatch: Colors.indigo
      ),
      home: ProgramaticallyTabs(title: title),
    );
  }
}

class TabbedApp extends StatefulWidget {
  final String title;

  const TabbedApp({Key? key, required this.title}) : super(key: key);

  @override
  State<TabbedApp> createState() => _TabbedAppState();
}

class _TabbedAppState extends State<TabbedApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Tab 1',),
              Tab(text: 'Tab 2',),
              Tab(text: 'Tab 3',)
            ]
          ),
        ),
        // TabBarView only define by DefaultTabController length.
        body: const TabBarView(
          children: [
            Center(child: Text('Tab 1 Contents')),
            Center(child: Text('Tab 2 Contents')),
            Center(child: Text('Tab 3 Contents'))
          ]
        ),
      ),
    );
  }
}

class ProgramaticallyTabs extends StatefulWidget {
  final String title;

  const ProgramaticallyTabs({Key? key, required this.title}) : super(key: key);

  @override
  State<ProgramaticallyTabs> createState() => _ProgramaticallyTabsState();
}

class _ProgramaticallyTabsState extends State<ProgramaticallyTabs> with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar ${controller.index + 1}'),
        centerTitle: true,
        bottom: TabBar(
          controller: controller,
          tabs: const [
            Tab(text: 'Tab 1',),
            Tab(text: 'Tab 2',),
            Tab(text: 'Tab 3',)
          ]
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          Center(child: Text('Tab 1 Contents')),
          Center(child: Text('Tab 2 Contents')),
          Center(child: Text('Tab 3 Contents'))
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 32),
        onPressed: () {
          controller.animateTo(2);
        }
      )
    );
  }
}