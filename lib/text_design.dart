import 'package:flutter/material.dart';


class TextDesign extends StatelessWidget {
  const TextDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MytextDesign(),
    );
  }
}

class MytextDesign extends StatefulWidget {
  const MytextDesign({Key? key}) : super(key: key);

  @override
  State<MytextDesign> createState() => _MytextDesignState();
}

class _MytextDesignState extends State<MytextDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Text Design'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              width: 120.0,
              child: Text(
                'This is very very very Long Text',
                maxLines: 1,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              ),
            ),
            SizedBox(
              width: 120.0,
              child: Text(
                'This is very very very Long Text',
                maxLines: 1,
                overflow: TextOverflow.fade,
                softWrap: false,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              ),
            ),
            SizedBox(
              width: 120.0,
              child: Text(
                'This is very very very Long Text',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              ),
            ),
            SizedBox(
              width: 120.0,
              child: Text(
                'This is very very very Long Text',
                maxLines: 1,
                overflow: TextOverflow.visible,
                softWrap: false,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}