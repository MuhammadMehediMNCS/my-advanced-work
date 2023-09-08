import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SwitchButtonDesign extends StatelessWidget {
  static const String title = 'Switch Button';

  const SwitchButtonDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.green.shade200,
        primarySwatch: Colors.indigo
      ),
      home: const SwitchButtonWidget(title: title),
    );
  }
}

class SwitchButtonWidget extends StatefulWidget {
  final String title;

  const SwitchButtonWidget({super.key, required this.title});

  @override
  State<SwitchButtonWidget> createState() => _SwitchButtonWidgetState();
}

class _SwitchButtonWidgetState extends State<SwitchButtonWidget> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Image.asset(
              value ? 'Assets/on.png' : 'Assets/off.png',
              height: 300,
            ),
            const Spacer(),
            buildPlatforms(),
            const SizedBox(height: 12),
            buildHeader(
              text: 'Adaptive',
              child: buildSwitch()
            ),
            const SizedBox(height: 12),
            buildHeader(
              text: 'Android Image',
              child: buildSpecialAndroidSwitch()
            ),
            const SizedBox(height: 12)
          ],
        ),
      ),
    );
  }

  Widget buildPlatforms() => Row(
    children: [
      Expanded(
        child: buildHeader(text: 'Android', child: buildAndroidSwitch())
      ),
      Expanded(
        child: buildHeader(text: 'iOS', child: buildIOSSwitch())
      )
    ],
  );

  Widget buildHeader({
    required String text,
    required Widget child
  }) => Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        text,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      child
    ],
  );

  Widget buildSwitch() => Transform.scale(
    scale: 2,
    child: Switch.adaptive(
      thumbColor: MaterialStateProperty.all(Colors.red),
      trackColor: MaterialStateProperty.all(Colors.orange),
      // activeColor: Colors.blueAccent,
      // activeTrackColor: Colors.blue.withOpacity(0.4),
      // inactiveThumbColor: Colors.orange,
      // inactiveTrackColor: Colors.black87,
      value: value, 
      onChanged: (value) => setState(() => this.value = value)
    ),
  );

  Widget buildIOSSwitch() => Transform.scale(
    scale: 1.1,
    child: CupertinoSwitch(
      value: value,
      onChanged: (value) => setState(() => this.value = value)
    ),
  );

  Widget buildAndroidSwitch() => Transform.scale(
    scale: 2,
    child: Switch(
      value: value,
      onChanged: (value) => setState(() => this.value = value)
    ),
  );

  Widget buildSpecialAndroidSwitch() => Transform.scale(
    scale: 2,
    child: SizedBox(
      width: 75,
      child: Switch(
        trackColor: MaterialStateProperty.all(Colors.black38),
        activeColor: Colors.green.withOpacity(0.4),
        inactiveThumbColor: Colors.red.withOpacity(0.4),
        activeThumbImage: const AssetImage('assets/thumbs_up.png'),
        inactiveThumbImage: const AssetImage('assets/thumbs_down.png'),
        value: value,
        onChanged: (value) => setState(() => this.value = value)
      ),
    ),
  );
}