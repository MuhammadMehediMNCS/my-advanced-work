import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:some_advanced/flutter_nav_and_route/home_page.dart';
import 'buildPage_1.dart';

class OnBordingPage extends StatelessWidget {
  static const String title = 'OnBording Page Scroll';
  final bool showHome;

  const OnBordingPage({super.key, required this.showHome});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.blueGrey.shade500,
        primarySwatch: Colors.blueGrey,
      ),
      home: showHome ? const HomePage() : const OnBScreen(title: title),
    );
  }
}

class OBPScroll extends StatefulWidget {
  final String title;

  const OBPScroll({super.key, required this.title});

  @override
  State<OBPScroll> createState() => _OBPScrollState();
}

class _OBPScrollState extends State<OBPScroll> {
  final controller = PageController();

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          children: [
            Container(
              color: Colors.red.shade300,
              child: const Center(
                child: Text(
                  'Page One',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                )
              ),
            ),
            Container(
              color: Colors.indigo.shade300,
              child: const Center(
                child: Text(
                  'Page Two',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                )
              ),
            ),
            Container(
              color: Colors.green.shade300,
              child: const Center(
                child: Text(
                  'Page Three',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                )
              ),
            ),
            Container(
              color: Colors.orangeAccent,
              child: const Center(
                child: Text(
                  'Page Four',
                  style: TextStyle(fontSize: 35, color: Colors.white),
                )
              ),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => controller.jumpToPage(3),
              child: const Text('Skip')
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 4,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.teal.shade700
                ),
                onDotClicked: (index) => controller.animateToPage(  // Use it for Tap directly Dot Indecator
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn
                ),
              ),
            ),
            TextButton(
              onPressed: () => controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut
              ),
              child: const Text('Next')
            )
          ],
        ),
      ),
    );
  }
}

class OnBScreen extends StatefulWidget {
  final String title;

  const OnBScreen({super.key, required this.title});

  @override
  State<OnBScreen> createState() => _OnBScreenState();
}

class _OnBScreenState extends State<OnBScreen> {
  final controller = PageController();
   bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();

    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) => setState(() => isLastPage = index == 2),
          children: [
            buildPage(
              color: Colors.green.shade300,
              urlImage: 'urlImage',
              title: 'REDUCE',
              subtitle: 'Lorem ipsum dolor sit amet, consectetur sipiscing elit, sed do elusmod trmpor indididunt ut labore et dolore magna aliqua'
            ),
            buildPage(
              color: Colors.blue.shade100,
              urlImage: 'urlImage',
              title: 'RECYCLE',
              subtitle: 'Lorem ipsum dolor sit amet, consectetur sipiscing elit, sed do elusmod trmpor indididunt ut labore et dolore magna aliqua'
            ),
            buildPage(
              color: Colors.deepOrange.shade200,
              urlImage: 'urlImage',
              title: 'REUSE',
              subtitle: 'Lorem ipsum dolor sit amet, consectetur sipiscing elit, sed do elusmod trmpor indididunt ut labore et dolore magna aliqua'
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
      ? TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            ),
            primary: Colors.white,
            backgroundColor: Colors.teal.shade700,
            maximumSize: const Size.fromHeight(80)
          ),
          onPressed: () async {
            // Use (shared_preferences: ^2.0.17) Package
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('showHome', true);
      
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(context, 
            MaterialPageRoute(builder: (context) => PageOne()));
          },
          child: const Text(
            'Get Started',
            style: TextStyle(fontSize: 24),
          )
        )
      : Container(
        padding: const EdgeInsets.symmetric(vertical: 22),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () => controller.jumpToPage(3),
              child: const Text('Skip')
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.black26,
                  activeDotColor: Colors.teal.shade700
                ),
                onDotClicked: (index) => controller.animateToPage(  // Use it for Tap directly Dot Indecator
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn
                ),
              ),
            ),
            TextButton(
              onPressed: () => controller.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut
              ),
              child: const Text('Next')
            )
          ],
        ),
      ),
    );
  }
  Widget buildPage({
    required Color color,
    required String urlImage,
    required String title,
    required String subtitle
  }) => Container(
    color: color,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          urlImage,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        const SizedBox(height: 64),
        Text(
          title,
          style: TextStyle(
            color: Colors.teal.shade700,
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(),
          child: Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black
            ),
          ),
        )
      ],
    ),
  );
}