// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Future<bool?> Warning(BuildContext context) async => showDialog<bool>(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            title: const Text('Confirmation Message :'),
            titlePadding: const EdgeInsets.only(left: 15.0, top: 15.0),
            content: const Text('Do You want to Exit this App?\nClick Below'),
            //contentTextStyle: TextStyle(fontSize: 45.0),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text(
                    'No',
                    style: TextStyle(color: Colors.black),
                  )),
              const SizedBox(width: 40.0),
              TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ));

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final ShowPop = await Warning(context);
        return ShowPop ?? false;
      },
      child: Scaffold(
          backgroundColor: Colors.green[200],
          appBar: AppBar(
            title: const Text('WillPopScope'),
            centerTitle: true,
          ),
          ),
    );
  }
}