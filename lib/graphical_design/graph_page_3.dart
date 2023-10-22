import 'package:flutter/material.dart';


class multiZigzag extends StatelessWidget {
  const multiZigzag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GThree(),
    );
  }
}

class GThree extends StatefulWidget {
  const GThree({Key? key}) : super(key: key);

  @override
  State<GThree> createState() => _GThreeState();
}

class _GThreeState extends State<GThree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wave Clipper Design'),
      ),
      body: Container(
        child: Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Colors.deepOrange,
                  height: 200,
                ),
              ),
            ),
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Colors.red,
                height: 180,
                alignment: Alignment.center,
                child: Text(
                  'Wave Clipper',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);   //Start path with this if you are making
    var firstStart = Offset(size.width / 5, size.height);
    // First point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    // Second point of quadratic bezier curve
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
    // Third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    // Fourth point of quadratic bezier curve
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}