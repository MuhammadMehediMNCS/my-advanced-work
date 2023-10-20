import 'package:flutter/material.dart';

class PopUpMenuPage extends StatefulWidget {
  const PopUpMenuPage({Key? key}) : super(key: key);

  @override
  State<PopUpMenuPage> createState() => _PopUpMenuPageState();
}

class _PopUpMenuPageState extends State<PopUpMenuPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('PopUp Menu'),
      actions: [
        PopupMenuButton(
          onSelected: (value) {},
          itemBuilder: (context) => [
            const PopupMenuItem(
              child: Text('Item 1')
            ),
            const PopupMenuItem(
              child: Text('Item 2')
            ),
            const PopupMenuItem(
              child: Text('Item 3')
            ),
            const PopupMenuItem(
              child: Text('Item 4')
            ),
          ]
        )
      ],
    ),
  );
}