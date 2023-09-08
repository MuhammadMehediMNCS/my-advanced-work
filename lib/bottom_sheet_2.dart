import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  static const String title = 'Bottom Sheet';

  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: BottomSheetDesign(title: title,),
    );
  }
}


class BottomSheetDesign extends StatefulWidget {
  final String title;

  const BottomSheetDesign({super.key, required this.title});

  @override
  State<BottomSheetDesign> createState() => _BottomSheetDesignState();
}

class _BottomSheetDesignState extends State<BottomSheetDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(180, 50),
                shape: const StadiumBorder()
              ),
              child: const Text('Simple Sheet'),
              onPressed: () => showModalBottomSheet(
                enableDrag: false,
                isDismissible: false,
                context: context,
                builder: (context) => buildSheet()
              )
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(180, 50),
                shape: const StadiumBorder()
              ),
              child: const Text('Custom Sheet'),
              onPressed: () => showModalBottomSheet(
                //backgroundColor: Colors.transparent,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20))
                ),
                context: context,
                builder: (context) => buildFullSheet(),
              )
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(180, 50),
                shape: const StadiumBorder()
              ),
              child: const Text('Full Screen Sheet'),
              onPressed: () => showModalBottomSheet(
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (context) => buildScrollableSheet()
              )
            )
          ],
        ),
      ),
    );
  }

  Widget buildSheet() => ListView(
    // We can use only Container and it's height.
    children: const [
      Text("These examples are programmatically compiled from various online sources to illustrate current usage of the word 'description.' Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors. Send us feedback about these examples."),
      Text("These examples are programmatically compiled from various online sources to illustrate current usage of the word 'description.' Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors. Send us feedback about these examples."),
      Text("These examples are programmatically compiled from various online sources to illustrate current usage of the word 'description.' Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors. Send us feedback about these examples."),
      Text("These examples are programmatically compiled from various online sources to illustrate current usage of the word 'description.' Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors. Send us feedback about these examples."),
    ],
  );

  Widget buildFullSheet() => Container(
    padding: const EdgeInsets.all(16),
    //color: Colors.white,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text("These examples are programmatically compiled from various online sources to illustrate current usage of the word 'description.' Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors. Send us feedback about these examples."),
        Text("These examples are programmatically compiled from various online sources to illustrate current usage of the word 'description.' Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors. Send us feedback about these examples."),
      ]
    ),
  );

  Widget makeDismissible({required Widget child}) => GestureDetector(
    behavior: HitTestBehavior.opaque,
    onTap: () => Navigator.of(context).pop(),
    child: GestureDetector(onTap: () {}, child: child,),
  );

  Widget buildScrollableSheet() => makeDismissible(
    child: DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.8,
      builder: (_, controller) => Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))
        ),
        child: ListView(
          controller: controller,
          children: const [
            Text("These examples are programmatically compiled from various online sources to illustrate current usage of the word 'description.' Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors. Send us feedback about these examples."),
            Text("These examples are programmatically compiled from various online sources to illustrate current usage of the word 'description.' Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors. Send us feedback about these examples."),
            Text("These examples are programmatically compiled from various online sources to illustrate current usage of the word 'description.' Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors. Send us feedback about these examples."),
            Text("These examples are programmatically compiled from various online sources to illustrate current usage of the word 'description.' Any opinions expressed in the examples do not represent those of Merriam-Webster or its editors. Send us feedback about these examples."),
          ]
        ),
      ),
    ),
  );
}