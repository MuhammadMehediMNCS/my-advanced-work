import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:some_advanced/flutter_navigation_and_route/second_page.dart';

import 'five_page.dart';

class PageSix extends StatelessWidget {
  const PageSix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: const Text('Page Six'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
              child: const Text('Pop: Page 5, N.pop'),
              onPressed: () => Navigator.pop(context)
            ),
            const SizedBox(height: 20),
              ElevatedButton(
              child: const Text('Pop All: Page 1. N.popUntil'),
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst)
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Push Pop All : Page 6, puAnReUn'),
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => const PageFive()),
                (route) => false  //route.isFrist
              )
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('maybeOf'),
              onPressed: () => Navigator.maybeOf(context)
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('maybePop'),
              onPressed: () => Navigator.maybePop(context)
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('canPop'),
              onPressed: () => Navigator.canPop(context)
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('pushNamedAndRemoveUntil'),
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, '/PageFour',
                (route) => false
                //ModalRoute.withName('/FirstPage')
              )
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Route From App: Page 2, puRepl'),
              onPressed: () => Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => const SecondPage())
              )
            )
            ],
          ),
        ),
      ),
    );
  }
}