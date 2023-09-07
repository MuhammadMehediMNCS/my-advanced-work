import 'package:flutter/material.dart';

class C_Box extends StatelessWidget {
  const C_Box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Check_B(),
    );
  }
}

class Check_B extends StatefulWidget {
  const Check_B({Key? key}) : super(key: key);

  @override
  State<Check_B> createState() => _Check_BState();
}

class _Check_BState extends State<Check_B> {

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.red
          ),
          child: CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: const Text('CheckBox'),
            subtitle: const Text('Subtitle'),
            activeColor: Colors.red,
            checkColor: Colors.white,
            value: isChecked,
            onChanged: (value) {
              setState(() => isChecked = value!);
            }
          ),

        // Checkbox(
        //             activeColor: Colors.red,
        //             checkColor: Colors.white,
        //             value: isChecked,
        //             onChanged: (value) {
        //               setState(() => isChecked = value!);
        //             }
        //           ),

        ),
      ),
    );
  }
}