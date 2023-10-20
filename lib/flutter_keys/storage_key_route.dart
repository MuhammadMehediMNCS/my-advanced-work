import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:some_advanced/flutter_keys/storage_key_list.dart';




final bucketGlobal = PageStorageBucket();

class StorageKeyRoute extends StatelessWidget {
  const StorageKeyRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavPush(),
    );
  }
}

class NavPush extends StatefulWidget {
  const NavPush({Key? key}) : super(key: key);

  @override
  State<NavPush> createState() => _NavPushState();
}

class _NavPushState extends State<NavPush> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Page Storage Key with Navigation Route'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('See the Result'),
              onPressed: () => Navigator.push(context, CupertinoPageRoute(builder: (context) => StoreKeyNavigate())),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreKeyNavigate extends StatefulWidget {
  const StoreKeyNavigate({Key? key}) : super(key: key);

  @override
  State<StoreKeyNavigate> createState() => _StoreKeyNavigateState();
}

class _StoreKeyNavigateState extends State<StoreKeyNavigate> {
  int selecetedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Storage Key'),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selecetedIndex,
        onTap: (index) => setState(() {selecetedIndex = index;}),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.close, size: 28,),
            label: 'ListView'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28,),
            label: 'Key ListView'
          )
        ]
      ),
      // If you want to see the scroll position same place after the page route, then PageStorage() must be used body or scaffold.
      body: PageStorage(
        bucket: bucketGlobal,
        child: const buildPageOne()
      ),
    );
  }
}