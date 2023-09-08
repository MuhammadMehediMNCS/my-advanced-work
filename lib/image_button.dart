import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  static const String titile = 'Image Button';
  
  const ImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: titile,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: const CircleDesignButton(titile: titile),
    );
  }
}

class ImgButton extends StatefulWidget {
  final String titile;

  const ImgButton({super.key, required this.titile});

  @override
  State<ImgButton> createState() => _ImgButtonState();
}

class _ImgButtonState extends State<ImgButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titile),
        centerTitle: true,
      ),
      body: Center(
        child: Material(
          elevation: 8,
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            splashColor: Colors.black26,
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Ink.image(
                  image: const AssetImage("images/Ok.png"),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 6),
                const Text(
                  'Button',
                  style: TextStyle(fontSize: 26),
                ),
                const SizedBox(height: 6)
              ],
            )
          ),
        ),
      ),
    );
  }
}

class RowDeisgnButton extends StatefulWidget {
  final String titile;

  const RowDeisgnButton({super.key, required this.titile});

  @override
  State<RowDeisgnButton> createState() => _RowDeisgnButtonState();
}

class _RowDeisgnButtonState extends State<RowDeisgnButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titile),
        centerTitle: true,
      ),
      body: Center(
        child: Material(
          elevation: 8,
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(12),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: InkWell(
            splashColor: Colors.black26,
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Ink.image(
                  image: const AssetImage("images/Ok.png"),
                  height: 60,
                  width: 80,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 6),
                const Text(
                  'Button',
                  style: TextStyle(fontSize: 26),
                ),
                const SizedBox(width: 6)
              ],
            )
          ),
        )
      ),
    );
  }
}

class CircleDesignButton extends StatefulWidget {
  final String titile;

  const CircleDesignButton({super.key, required this.titile});

  @override
  State<CircleDesignButton> createState() => _CircleDesignButtonState();
}

class _CircleDesignButtonState extends State<CircleDesignButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titile),
        centerTitle: true,
      ),
      body: Center(
        child: Material(
          elevation: 8,
          color: Colors.indigo.shade400,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.red, width: 3),
              shape: BoxShape.circle
            ),
            child: InkWell(
              splashColor: Colors.black26,
              onTap: () {},
              child: Ink.image(
                    image: const AssetImage("images/Ok.png"),
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}