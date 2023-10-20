import 'package:flutter/material.dart';
import '../flutter_nav_and_route/home_page.dart';
import 'page_Favourite.dart';

class NavigationDrawerPage extends StatefulWidget {
  const NavigationDrawerPage({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerPage> createState() => _NavigationDrawerPageState();
}

class _NavigationDrawerPageState extends State<NavigationDrawerPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Home'),
      centerTitle: true,
      backgroundColor: Colors.blue.shade400,
    ),
    drawer: const NavigationDrawer(),
  );
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildHeader(context),
          buildMenuItems(context)
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) => Material(
    color: Colors.blue.shade400,
    child: InkWell(
      onTap: () {
        // Close Navigation Drawer by Favourites BackButton Pressed.
        Navigator.pop(context);
            
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const UserPage()));
      },
      child: Container(
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24
        ),
        color: Colors.blue.shade400,
        child: Column(
          children: const [
            CircleAvatar(
              radius: 52,
              backgroundImage: NetworkImage('url'),
            ),
            SizedBox(height: 12),
            Text(
              'Maria Akter',
              style: TextStyle(fontSize: 28, color: Colors.white),
            ),
            Text(
              'mariaakter@gmail.com',
              style: TextStyle(fontSize: 16, color: Colors.white),
            )
          ],
        ),
      ),
    ),
  );

  Widget buildMenuItems(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    child: Wrap(
      runSpacing: 16,
      children: [
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Home'),
          onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomePage())),
        ),
        ListTile(
          leading: const Icon(Icons.favorite_border),
          title: const Text('Favourites'),
          onTap: () {
            // Close Navigation Drawer by Favourites BackButton Pressed.
            Navigator.pop(context);
            
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FavouritesPage()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.workspaces_outline),
          title: const Text('Workflow'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.update),
          title: const Text('Updates'),
          onTap: () {},
        ),
        const Divider(color: Colors.black54,),
        ListTile(
          leading: const Icon(Icons.account_tree_outlined),
          title: const Text('Plugins'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: const Text('Notifications'),
          onTap: () {},
        )
      ],
    ),
  );
}