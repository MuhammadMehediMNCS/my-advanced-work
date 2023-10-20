import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrientationWid extends StatelessWidget {
  const OrientationWid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyOrientation(),
    );
  }
}

class MyOrientation extends StatefulWidget {
  const MyOrientation({Key? key}) : super(key: key);

  @override
  State<MyOrientation> createState() => _MyOrientationState();
}

class _MyOrientationState extends State<MyOrientation> {
  @override
  Widget build(BuildContext context) => Scaffold(
    // backgroundColor: Colors.black,
    appBar: AppBar(
      title: const Text('Orientation Builder'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: setPortraitAndLandscape,
        )
      ],
    ),
    body: Container(
      padding: const EdgeInsets.all(32),
      child: OrientationBuilder(
        builder: (context, orientation) =>
        orientation == Orientation.portrait
        ? buildPortrait()
        : buildLandscape()
      )
    ),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.rotate_left),
      onPressed: () {
        final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

        if(isPortrait) {
          setLandscape();
        } else {
          setPortrait();
        }
      }
    ),
  );

  Future setPortrait() async => await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  Future setLandscape() async => await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  Future setPortraitAndLandscape() => SystemChrome.setPreferredOrientations(
    DeviceOrientation.values
  );

  Widget buildPortrait() => ListView(
    children: [
      buildImage(),
      const SizedBox(height: 16),
      buildText(),
    ],
  );

  Widget buildLandscape() => Row(
    children: [
      buildImage(),
      const SizedBox(width: 16),
      Expanded(child: SingleChildScrollView(child: buildText())),
    ],
  );

  Widget buildImage() => Image.asset(
    'images/Apple.png'
  );

  Widget buildText() => Column(
    children: const [
      Text(
        'Apple Laptop',
        style: TextStyle(fontSize: 24),
      ),
      SizedBox(height: 16),
      Text('Graphics: 7-core GPU, Operating System: macOS, Battery: Built-in 49.9 watt hour lithium polymer battery, Adapter: 30W USB-C power adapter, Audio: Stereo speakers Wide stereo sound Support for Dolby Atmos playback Three-mic array with directional beamforming 3.5 mm headphone jack')
    ],
  );
}


class OrientationWidget extends StatefulWidget {
  const OrientationWidget({Key? key}) : super(key: key);

  @override
  State<OrientationWidget> createState() => _OrientationWidgetState();
}

class _OrientationWidgetState extends State<OrientationWidget> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Orientation'),
    ),
    body: MediaQuery.of(context).orientation == Orientation.portrait
    ? Container(
      color: Colors.blue,
      child: const Center(child: Text('Portrait'),),
    )
    : Container(
      color: Colors.green,
      child: const Center(child: Text('Landscape')),
    ),
  );
}

class OrientationWidg extends StatefulWidget {
  const OrientationWidg({Key? key}) : super(key: key);

  @override
  State<OrientationWidg> createState() => _OrientationWidgState();
}

class _OrientationWidgState extends State<OrientationWidg> {
  @override
  Widget build(BuildContext context) => OrientationBuilder(
    builder: (context, orientation) {
      final isPortrait = orientation == Orientation.portrait;
      final isMobile = MediaQuery.of(context).size.shortestSide < 600;

      return Scaffold(
        appBar: AppBar(
          title: const Text('Orientation'),
        ),
        drawer: isMobile 
        ? Drawer(
          child: Container(
            color: Colors.green,
            width: 300,
            child: const Center(child: Text('SideBar'),),
          ),
        )
        : null,
        body: Row(
          children: [
            if(!isMobile)
            Container(
              color: Colors.green,
              width: 300,
              child: const Center(child: Text('SideBar'),),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: isPortrait ? 2 : 3,
                children: List.generate(
                  40,
                  (index) => Card(
                  color: Colors.orange,
                  child: Center(child: Text('Item $index'),),
                  )
                ),
              ),
            )
          ],
        ),
      );
      
      
      // isPortrait
      // ? Container(
      //   color: Colors.blue,
      //   child: const Center(child: Text('Portrait'),),
      // )
      // : Container(
      //   color: Colors.green,
      //   child: const Center(child: Text('Landscape'),),
      // );
    }
  );
}