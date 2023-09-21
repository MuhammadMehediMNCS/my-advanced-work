import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String title;

  const HeaderWidget({
    Key? key,
    required this.title
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}