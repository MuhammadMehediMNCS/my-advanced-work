// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'buildPage_1.dart';
import 'buildPage_2.dart';

class IndicatorsDot extends StatelessWidget {
  static const String title = 'Dot Indicator Design';

  const IndicatorsDot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.red.shade200,
        primarySwatch: Colors.indigo
      ),
      home: const packageIndicator(title: title),
    );
  }
}

class packageIndicator extends StatefulWidget {
  final String title;

  const packageIndicator({super.key, required this.title});

  @override
  State<packageIndicator> createState() => _packageIndicatorState();
}

class _packageIndicatorState extends State<packageIndicator> {
  final controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
        children: [
          SizedBox(
            height: 300,
            child: PageView(
              controller: controller,
              children: const [
                PageOne(),
                PageTwo()
              ],
            ),
          ),
          Container(
            height: 10,
            child: SmoothPageIndicator(
              controller: controller,
              count: 2,
              /*
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.red,
                dotColor: Colors.red,
                dotHeight: 30,
                dotWidth: 30,
                spacing: 30
              ), */
              /*
              effect: const SwapEffect(
                activeDotColor: Colors.red,
                dotColor: Colors.red,
                dotHeight: 30,
                dotWidth: 30,
                spacing: 30
              ), */
              effect: const JumpingDotEffect(
                activeDotColor: Colors.red,
                dotColor: Colors.red,
                dotHeight: 30,
                dotWidth: 30,
                spacing: 30,
                //verticalOffset: 10,
                jumpScale: 10
              ),
            ),
          ),
        
        ],
      ),
    );
  }
}