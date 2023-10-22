// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class ZigzagUI extends StatelessWidget {
  static const String title = 'Clip Path';

  const ZigzagUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.amber.shade200,
        primarySwatch: Colors.indigo
      ),
      home: const GraphUIDesign(),
    );
  }
}

class GraphUIDesign extends StatefulWidget {
  const GraphUIDesign({super.key});

  @override
  State<GraphUIDesign> createState() => _GraphUIDesignState();
}

class _GraphUIDesignState extends State<GraphUIDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          color: Colors.red,
          child: const Center(
            child: Text(
              'Clip Path',
              style: TextStyle(fontSize: 40, color: Colors.white),
            )
          ),
          height: 400,
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    // Curve web : https://shapemaker.web.app

    //path.moveTo(0, 100);

    // Container Top Left Corner point 1 (0,0) to Bottom Left Corner point 2 (0, h)
    path.lineTo(0, h);
    // Container Bottom Left Corner point 2 (0, h) to Right Bottom Corner point 4 (w, h)
    path.quadraticBezierTo(
      w * 0.5, // 2 and 4 middle point 3
      h - 100, // 2 to 4 Curve
      w,
      h
    );
    // Container Bottom Right Corner point 4 (w, h) to Top Right Corner point 5(w, 0)
    path.lineTo(w, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}