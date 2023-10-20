// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class ButtonNeumorphism extends StatelessWidget {
  static const String title = 'Make Neumorphism Button';

  const ButtonNeumorphism({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.grey,
        primarySwatch: Colors.indigo
      ),
      home: const NeumorDesign(title: title),
    );
  }
}

class NeumorDesign extends StatefulWidget {
  final String title;

  const NeumorDesign({super.key, required this.title});

  @override
  State<NeumorDesign> createState() => _NeumorDesignState();
}

class _NeumorDesignState extends State<NeumorDesign> {
  bool isPressed = true;
  bool isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    final backgrounColor = isDarkMode ? const Color(0xFF2E3239) : const Color(0xFFE7ECEF);
    Offset distance = isPressed ? const Offset(10, 10) : const Offset(28, 28);
    double blur = isPressed ? 5.0 : 30.0;
  
    return Scaffold(
      backgroundColor: backgrounColor,
      body: Center(
        child: Listener(
          // We can use GestureDetector(OnTap: () => setState(() => isPressed = !isPressed))
          onPointerUp: (_) => setState(() => isPressed = false),
          onPointerDown: (_) => setState(() => isPressed = true),
          child: AnimatedContainer(
            duration: const Duration(microseconds: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: backgrounColor,
              boxShadow: isPressed
              // Neumorphism Button Code web: https://neumorphism.coldstone.fun
              ? []
              : [
                BoxShadow(
                  blurRadius: blur,
                  offset: - distance,
                  color: isDarkMode ? const Color(0xFF32393F) : Colors.white,
                ),
                BoxShadow(
                  blurRadius: blur,
                  offset: distance,
                  color: isDarkMode ? const Color(0xFF23262A) : const Color(0xFFA7A9AF)
                )
              ]
            ),
            child: const SizedBox(
              height: 200,
              width: 200,
            ),
          ),
        ),
      ),
    );
  }
}