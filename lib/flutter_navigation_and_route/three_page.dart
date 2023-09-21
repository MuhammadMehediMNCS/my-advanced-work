import 'package:flutter/material.dart';

import 'four_page.dart';

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Three'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Push: Page 4'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageFour())
              )
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              child: const Text('Pop All: Page 1'),
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst)
            ),
          ],
        ),
      ),
    );
  }
}