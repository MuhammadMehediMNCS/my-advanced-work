import 'package:flutter/material.dart';
import 'package:some_advanced/flutter_navigation_and_route/six_page.dart';

class PageFive extends StatelessWidget {
  const PageFive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Page Five'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('Push: Page 6'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PageSix())
            )
          )
        ],
      ),
    ),
  );
}