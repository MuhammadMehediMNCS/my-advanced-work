import 'package:flutter/material.dart';

class PartOneLogic extends StatelessWidget {
  static const String title = 'This is a Logic Part One';

  const PartOneLogic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: const LogicPartOne(title: title),
    );
  }
}

class LogicPartOne extends StatefulWidget {
  final String title;
  
const LogicPartOne({super.key, required this.title});

@override
State<LogicPartOne> createState() => _LogicPartOneState();
}

class _LogicPartOneState extends State<LogicPartOne> {
bool istap = false;
void control() {
	setState(() {
	istap = !istap;
	});
}

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(),
	body: Column(
		mainAxisAlignment: MainAxisAlignment.center,
		children: [
		InkWell(
			onTap: control,
			child: Container(
			height: istap ? 300 : 100,
			width: istap ? 300 : 100,
			decoration: BoxDecoration(
				color: istap ? Colors.deepPurple : Colors.orange,
				borderRadius: istap
					? BorderRadius.circular(100)
					: BorderRadius.circular(0)),
			),
		),
		],
	),
	);
}
}
