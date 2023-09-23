import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:some_advanced/dot_indicator_design/on_bording_dot.dart';
import 'package:some_advanced/flutter_nav_and_route/routes.dart';
import 'package:some_advanced/flutter_nav_and_route/widget.dart';

class HomePage extends StatelessWidget {

  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(Routes.title),
      actions: [
        IconButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('showHome', false);

            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => OnBScreen(title: 'title')));
          },
          icon: const Icon(Icons.logout)
        )
      ],
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          HeaderWidget(title: 'Splash Page'),
        ],
      ),
    ),
  );
}