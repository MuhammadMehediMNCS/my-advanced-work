import 'package:flutter/material.dart';

class ZigzagStyle extends StatelessWidget {
  const ZigzagStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GTwo(),
    );
  }
}


class GTwo extends StatefulWidget {
  const GTwo({Key? key}) : super(key: key);

  @override
  State<GTwo> createState() => _GTwoState();
}

class _GTwoState extends State<GTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 320,
              decoration: BoxDecoration(
                color: Colors.red
              ),
              child: Center(
                child: Text(
                  'Clip Path with Zigzag',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 45.0)
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height-70);
    var controllPoint = Offset(50, size.height);
    var endPoint = Offset(size.width/2, size.height);
    path.quadraticBezierTo(controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}