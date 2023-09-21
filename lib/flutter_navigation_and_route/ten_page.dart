import 'package:flutter/material.dart';

class PageTen extends StatelessWidget {
  const PageTen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Page Ten'),
      centerTitle: true,
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('Replace: Page 1'),
            onPressed: () => Navigator.pop(context)
          )
        ],
      ),
    ),
  );
}