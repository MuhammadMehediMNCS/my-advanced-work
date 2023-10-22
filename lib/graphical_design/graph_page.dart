import 'dart:html';

import 'package:flutter/material.dart';

class LineStyle extends StatelessWidget {
  const LineStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GOne(),
    );
  }
}

class GOne extends StatefulWidget {
  const GOne({Key? key}) : super(key: key);

  @override
  State<GOne> createState() => _GOneState();
}

class _GOneState extends State<GOne> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clip Path with Line'),
      ),
      body: Center(
        child: Stack(
          children: [ 
            ClipPath(
              clipper: LinePath(),
              child: Container(
                color: Colors.red,
              ),
            ),
            Icon(Icons.person_outline, size: 100),
          ],
        ),
      ),
    );
  }
}

class LinePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, 350);
    path.lineTo(350, 0);
    path.lineTo(size.width-500, size.height-600);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}