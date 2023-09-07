import 'package:flutter/material.dart';

class bSheet extends StatelessWidget {
  const bSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BotSheet(),
    );
  }
}

class BotSheet extends StatefulWidget {
  const BotSheet({Key? key}) : super(key: key);

  @override
  State<BotSheet> createState() => _BotSheetState();
}

class _BotSheetState extends State<BotSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Open Bottom Sheet'),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              barrierColor: Colors.orange[300],
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20)
                )
              ),
              builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FlutterLogo(size: 120),
                  const FlutterLogo(size: 120),
                  const FlutterLogo(size: 120),
                  const FlutterLogo(size: 120),
                  Center(
                  child: ElevatedButton(
                    child: const Text('Close'),
                    onPressed: () => Navigator.pop(context),
                  )
                ),
                ]
              )
            );
          }
        )
      ),
    );
  }
}