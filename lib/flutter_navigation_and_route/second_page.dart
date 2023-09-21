import 'package:flutter/material.dart';
import 'package:some_advanced/flutter_navigation_and_route/three_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Push: Page 3'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PageThree())
              )
            ),
            const SizedBox(height: 24),
            
            
          ],
        ),
      ),
    );
  }
}