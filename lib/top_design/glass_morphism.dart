import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphismDesign extends StatelessWidget {
  static const String title = 'Glass Morphism Design';

  const GlassMorphismDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.amber.shade200,
        primarySwatch: Colors.indigo
      ),
      home: const GMEffects(title: title),
    );
  }
}

class GlassEffect extends StatefulWidget {
  final String title;

  const GlassEffect({super.key, required this.title});

  @override
  State<GlassEffect> createState() => _GlassEffectState();
}

class _GlassEffectState extends State<GlassEffect> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade300,
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVKFQaatxtq3Sasv34MB5se8IBSjOWfSlwKgSSucUpeHamS37ar3-3vquzVVc8-mHju-M&usqp=CAU'),
            fit: BoxFit.cover
          ),
        ),
        child: GestureDetector(
          onTapDown: (_) {
            setState(() => isPressed = true);
          },
          onTapUp: (_) {
            setState(() => isPressed = false);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQwzt2O1GYzQOYed7ja4ChMAY_SbDidluW7Q&usqp=CAU',
                    ),
                    fit: BoxFit.cover,
                    opacity: 0.5
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 25,
                      spreadRadius: -5
                    )
                  ],
                  color: Colors.white.withOpacity(isPressed ? 0.4 : 0.3),
                  // gradient: const LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomCenter,
                  //   colors: [Colors.white60, Colors.white30]
                  // ),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 2, color: Colors.black26)
                ),
                child: const Center(
                  child: Text(
                    'Glass',
                    style: TextStyle(fontSize: 80, color: Colors.white54),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GMEffects extends StatefulWidget {
  final String title;

  const GMEffects({super.key, required this.title});

  @override
  State<GMEffects> createState() => _GMEffectsState();
}

class _GMEffectsState extends State<GMEffects> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange.shade300,
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          onTapDown: (_) {
            setState(() => isPressed = true);
          },
          onTapUp: (_) {
            setState(() => isPressed = false);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQwzt2O1GYzQOYed7ja4ChMAY_SbDidluW7Q&usqp=CAU',
                    ),
                    fit: BoxFit.cover,
                    opacity: 0.5
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 25,
                      spreadRadius: -5
                    )
                  ],
                  color: Colors.white.withOpacity(isPressed ? 0.4 : 0.3),
                  // gradient: const LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomCenter,
                  //   colors: [Colors.white60, Colors.white30]
                  // ),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(width: 2, color: Colors.black26)
                ),
                child: const Center(
                  child: Text(
                    'Glass',
                    style: TextStyle(fontSize: 80, color: Colors.white54),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}