
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ShowOrHideNavyBar extends StatelessWidget {
  static const String title = 'Hide Bottom Navigation Bar';

  const ShowOrHideNavyBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.blue.shade200,
        primarySwatch: Colors.indigo
      ),
      home: const HideBottomBar(title: title),
    );
  }
}

class HideBottomBar extends StatefulWidget {
  final String title;

  const HideBottomBar({super.key, required this.title});

  @override
  State<HideBottomBar> createState() => _HideBottomBarState();
}

class _HideBottomBarState extends State<HideBottomBar> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = ScrollController();
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
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        controller: controller,
        itemCount: 25,
        itemBuilder: (context, index) => buildCard(index + 1)
      ),
      bottomNavigationBar: ScrollToHideWidget(
        controller: controller,
        child: BottomNavigationBar(
          backgroundColor: Colors.blue,
          fixedColor: Colors.white,
          unselectedItemColor: Colors.white,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Feed'
            ),
          ]
        ),
      ),
    );
  }

  Widget buildCard(int sum){
    return ListTile(
      title: Text('Item $sum'),
    );
  }
}

class ScrollToHideWidget extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  final double height;

  const ScrollToHideWidget({
    super.key,
    required this.child,
    required this.controller,
    this.duration = const Duration(milliseconds: 200),
    this.height = kBottomNavigationBarHeight
  });

  @override
  State<ScrollToHideWidget> createState() => _ScrollToHideWidgetState();
}

class _ScrollToHideWidgetState extends State<ScrollToHideWidget> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    super.dispose();

    widget.controller.removeListener(listen);
  }

  void listen() {
    final direction = widget.controller.position.userScrollDirection;

    if(direction == ScrollDirection.forward) {
      show();
    } else if(direction == ScrollDirection.reverse) {
      hide();
    }

   /* Or
    if(widget.controller.position.pixels >= 200) {
      hide();
    } else {
      show();
    } */
  }

  void show() {
    if(!isVisible) setState(() => isVisible = true);
  }

  void hide() {
    if(isVisible) setState(() => isVisible = false);
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
    duration: widget.duration,
    height: isVisible ? widget.height : 0,
    child: Wrap(
      children: [
        widget.child
      ]
    )
  );
}