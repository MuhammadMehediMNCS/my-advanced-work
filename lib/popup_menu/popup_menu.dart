import 'package:flutter/material.dart';

import 'item.dart';

class PopUpMenu extends StatelessWidget {
  const PopUpMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PopMenu(),
    );
  }
}

class PopMenu extends StatefulWidget {
  const PopMenu({Key? key}) : super(key: key);

  @override
  State<PopMenu> createState() => _PopMenuState();
}

class _PopMenuState extends State<PopMenu> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Popup Menu'),
      actions: [
        PopupMenuButton(
          onSelected: (value) {
            if (value == 0) {
              // Clicked "Item 1"
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Item()
              ));
            } else if (value == 1) {
              // Clicked "Item 2"
            } else if (value == 2) {
              // Clicked "Item 3"
            } else if (value == 3) {
              // Clicked "Item 4"
            }
          },
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