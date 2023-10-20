import 'package:flutter/material.dart';

class NeonLight extends StatelessWidget {
  static const String title = 'Neon Light Effect';

  const NeonLight({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.amber.shade200,
      ),
      home: const NeonEffect(title: title),
    );
  }
}

class NeonEffect extends StatefulWidget {
  final String title;

  const NeonEffect({super.key, required this.title});

  @override
  State<NeonEffect> createState() => _NeonEffectState();
}

class _NeonEffectState extends State<NeonEffect> {
  bool isPresed = false;

  @override
  Widget build(BuildContext context) {
    Color shadowColor = Colors.red;  //Change Color Blue, Green, Purple
    Color backgroundColor = shadowColor.withOpacity(0.7);

    return Scaffold(
      backgroundColor: const Color(0xFF00000F),
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Listener(
          onPointerDown: (_) => setState(() {
            isPresed = true;
          }),
          onPointerUp: (_) => setState(() {
            isPresed = false;
          }),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isPresed ? backgroundColor : null,
              boxShadow: [
                for(double i = 1; i < 5; i++)
                BoxShadow(
                  color: shadowColor,
                  blurRadius: (isPresed ? 5 : 3) * i
                ),
                for(double i = 1; i < 5; i++)
                BoxShadow(
                  spreadRadius: -1,
                  color: shadowColor,
                  blurRadius: (isPresed ? 5 : 3) * i,
                  blurStyle: BlurStyle.outer
                )
              ]
            ),
            child: TextButton(
              onHover: (hovered) => setState(() {
                isPresed = hovered;
              }),
              style: TextButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onPressed: () {},
              child: Text(
                'Neon Button',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  shadows: [
                    for(double i = 1; i < (isPresed ? 8 : 4); i++)
                    Shadow(
                      color: shadowColor,
                      blurRadius: 3 * i
                    )
                  ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}