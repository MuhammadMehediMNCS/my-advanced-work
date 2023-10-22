import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:some_advanced/app_evy_bar/show_or_hide_navy.dart';
import 'material_navigation_bar.dart';

class WishNavyBar extends StatelessWidget {
  static const String title = 'Wish NavigationBar';

  const WishNavyBar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.green.shade200,
        primarySwatch: Colors.blueGrey
      ),
      home: const AsWishNavy(title: title),
    );
  }
}

class AsWishNavy extends StatefulWidget {
  final String title;

  const AsWishNavy({super.key, required this.title});

  @override
  State<AsWishNavy> createState() => _AsWishNavyState();
}

class _AsWishNavyState extends State<AsWishNavy> {
  late ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = ScrollController();
  }

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
      body: ListView.builder(
        controller: controller,
        itemCount: 25,
        itemBuilder: (context, index) => buildCounter(index + 1),
      ),
      bottomNavigationBar: ScrollToHideWidget(
        controller: controller,
        height: 80,
        child: Container(
          height: 80,
          padding: const EdgeInsets.all(16),
          color: Colors.blue.shade300,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 32,
                    ),
                    Icon(
                      Icons.favorite_outline,
                      color: Colors.white,
                      size: 32,
                    ),
                    ElevatedButton(
                      onPressed: null,
                      child: Text('Book Mark')
                    )
                  ],
                )
              )
            ],
          ),
        )
      ),
    );
  }

  Widget buildCounter(int sum) {
    return ListTile(
      title: Text('Items $sum'),
    );
  }
}