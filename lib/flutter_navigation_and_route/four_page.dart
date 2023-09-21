import 'package:flutter/material.dart';

import 'five_page.dart';

class PageFour extends StatelessWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Four'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Push: Page 5'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageFive())
              )
            )
          ],
        ),
      ),
    );
  }
}