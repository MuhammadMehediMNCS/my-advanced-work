import 'package:flutter/material.dart';

class CopySelectableTex extends StatelessWidget {
  static const String title = 'Copy Selectable Text';

  const CopySelectableTex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: const CopySText(title: title),
    );
  }
}

class CopySText extends StatefulWidget {
  final String title;

  const CopySText({super.key, required this.title});

  @override
  State<CopySText> createState() => _CopySTextState();
}

class _CopySTextState extends State<CopySText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SelectableText(
          '',
          style: const TextStyle(fontSize: 24),
          toolbarOptions: ToolbarOptions(
            copy: true,
            // cut: true,
            // selectAll: true,
            // paste: true
          ),
          showCursor: true,
          cursorWidth: 3,
          cursorColor: Colors.red,
          // cursorRadius: Radius.circular(16),
          // scrollPhysics: BouncingScrollPhysics(),
          //scrollPhysics: ClampingScrollPhysics(),
          // maxLines: 5,
          onTap: () {
            print('Clicked Selected Text....');
          },
        ),
      ),
    );
  }
}