import 'dart:math';
import 'package:flutter/material.dart';

class ObjKey extends StatelessWidget {
  const ObjKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ObjectWidget(),
    );
  }
}

class ObjectWidget extends StatefulWidget {
  const ObjectWidget({Key? key}) : super(key: key);

  @override
  State<ObjectWidget> createState() => _ObjectWidgetState();
}

class _ObjectWidgetState extends State<ObjectWidget> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();

    users = [
      User(name: 'Mehedi', country: 'Bangladesh'),
      User(name: 'Mehedi', country: 'Bangladesh'),
      User(name: 'name3', country: 'country3'),
      User(name: 'name', country: 'country')
    ];
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Object Key'),
      centerTitle: true,
    ),
    body: Center(
      child: Column(
        children: users
        .map<Widget>((user) => UserWidget(
          key: ObjectKey(user),
          user: user
        )).toList(),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: swapTiles,
      child: const Icon(Icons.swap_horiz, size: 32,)
    ),
  );

  void swapTiles() => setState(() {
    final user = users.removeAt(0);

    users.insert(2, user);
  });
}


class UserWidget extends StatefulWidget {
  final User user;

  const UserWidget({
    Key? key,
    required this.user
  }) : super(key: key);

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  late Color color;

  @override
  void initState() {
    super.initState();

    color = generateColor();
  }

  Color generateColor() {
    final random = Random();

    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255)
    );
  }

  @override
  Widget build(BuildContext context) => Container(
    color: color,
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      title: Text(widget.user.name),
      subtitle: Text(widget.user.country),
      trailing: Text('HashCode: ${widget.user.hashCode}'),
    ),
  );
}


class User {
  String name;
  String country;

  User({
    required this.name,
    required this.country
  });
}