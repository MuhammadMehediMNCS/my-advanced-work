import 'package:flutter/material.dart';

class BasicValueWidget extends StatelessWidget {
  const BasicValueWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DragFlip(),
    );
  }
}

class BasicValue extends StatefulWidget {
  const BasicValue({Key? key}) : super(key: key);

  @override
  State<BasicValue> createState() => _BasicValueState();
}

class _BasicValueState extends State<BasicValue> {
  bool showEmail = true;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Value Key'),
      centerTitle: true,
    ),
    body: Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(showEmail)
            const TextField(
              key: ValueKey(MyObject(1)),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email'
              ),
            ),
            const TextField(
              key: ValueKey(MyObject(2)),   // Value Key working by values. Use same user Name then show error.
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username'
              ),
            ),
          ],
        ),
      ),
    ),
    floatingActionButton: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder()
      ),
      icon: const Icon(Icons.visibility_off),
      label: const Text('Remove Email'),
      onPressed: () => setState(() {showEmail = false;}),
    ),
  );
}

class MyObject {
  final int number;

  const MyObject(this.number);

  @override 
  bool operator == (Object other) =>
    identical(this, other) ||
    other is MyObject &&
      runtimeType == other.runtimeType &&
      number == other.number;

  @override
  int get hashCode => number.hashCode;
}





class DragOnlyKey extends StatefulWidget {
  const DragOnlyKey({Key? key}) : super(key: key);

  @override
  State<DragOnlyKey> createState() => _DragOnlyKeyState();
}

class _DragOnlyKeyState extends State<DragOnlyKey> {
  final List<int> items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fliping with Key'),
      ),
      body: Center(
        child: ReorderableListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              key: Key('$index'),
              tileColor: items[index].isOdd ? oddItemColor : evenItemColor,
              title: Text('Item ${items[index]}'),
            );
          },
          itemCount: items.length,
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if(oldIndex < newIndex) {
                newIndex --;   // newIndex -= 1;
              }
              final int item = items.removeAt(oldIndex);
              items.insert(newIndex, item);
            });
          }
        ),
      ),
    );
  }
}





class DragFlip extends StatefulWidget {
  const DragFlip({Key? key}) : super(key: key);

  @override
  State<DragFlip> createState() => _DragFlipState();
}

class _DragFlipState extends State<DragFlip> {
  final List<String> products = List.generate(100, (index) => 'Product ${index.toString()}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fliping with Value Key'),
      ),
      body: ReorderableListView.builder(
        itemBuilder: (context, index) {
          final String productName = products[index];

          return Card(
            key: ValueKey(productName),
            elevation: 1,
            color: Colors.purple[200],
            margin: const EdgeInsets.all(10),
            child: ListTile(
              contentPadding: const EdgeInsets.all(25),
              title: Text(
                productName,
                style: const TextStyle(fontSize: 18),
              ),
              trailing: const Icon(Icons.drag_handle),
            ),
          );
        },
        itemCount: products.length,
        onReorder: ((oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex = newIndex -1;
            }
            final element = products.removeAt(oldIndex);
            products.insert(newIndex, element);
          });
        })
      ),
    );
  }
}






class ValKey extends StatefulWidget {
  const ValKey({Key? key}) : super(key: key);

  @override
  State<ValKey> createState() => _ValKeyState();
}

class _ValKeyState extends State<ValKey> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();

    users = [
      User(
        name: 'Knop', urlImage: 'https://images.pexels.com/photos/424134/pexels-photo-424134.jpeg?auto=compress&cs=tinysrgb&w=600'
      ),
      User(
        name: 'Flowerpot', urlImage: 'https://images.pexels.com/photos/42257/flowerful-flowery-flowerly-42257.jpeg?auto=compress&cs=tinysrgb&w=600'
      ),
      User(
        name: 'Sunflower', urlImage: 'https://images.pexels.com/photos/573020/pexels-photo-573020.jpeg?auto=compress&cs=tinysrgb&w=600'
      )
    ];
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Fliping List with Value Key'),
    ),
    body: ReorderableListView.builder(
      itemCount: users.length,
      onReorder: (oldIndex, newIndex) => setState(() {
        final index = newIndex > oldIndex ? newIndex : oldIndex;

        final user = users.removeAt(oldIndex);
        users.insert(index, user);
      }),
      itemBuilder: (context, index) {
        final user = users [index];

        return buildUser(index, user);
      },
    ),
  );

  Widget buildUser(int index, User user) => ListTile(
    key: ValueKey(user.name),
    contentPadding: const EdgeInsets.symmetric(horizontal: 28),
    leading: CircleAvatar(
      backgroundImage: NetworkImage(user.urlImage),
      radius: 30,
    ),
    title: Text(user.name),
  );
}


class User {
  String name;
  String urlImage;

  User({
    required this.name,
    required this.urlImage
  });
}