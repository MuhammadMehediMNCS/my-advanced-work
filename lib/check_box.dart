import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CheckBoxDesign(),
    );
  }
}

class CheckBoxDesign extends StatefulWidget {
  const CheckBoxDesign({Key? key}) : super(key: key);

  @override
  State<CheckBoxDesign> createState() => _CheckBoxDesignState();
}

class _CheckBoxDesignState extends State<CheckBoxDesign> {

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