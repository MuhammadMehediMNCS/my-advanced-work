import 'package:flutter/material.dart';
import 'package:some_advanced/flutter_navigation_and_route/second_page.dart';
import 'package:some_advanced/flutter_navigation_and_route/ten_page.dart';

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RouteWid(),
    );
  }
}

class RouteWid extends StatefulWidget {
  const RouteWid({Key? key}) : super(key: key);

  @override
  State<RouteWid> createState() => _RouteWidState();
}

class _RouteWidState extends State<RouteWid> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Navigator 1.0'),
      centerTitle: true,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('Push: Page 2'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondPage())
            )
          ),
          const SizedBox(height: 24),
            ElevatedButton(
              child: const Text('Replace: Page 2'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageTen())
              )
            )
        ],
      ),
    ),
  );
}