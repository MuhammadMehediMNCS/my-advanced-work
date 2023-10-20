import 'package:flutter/material.dart';

class MediaQue extends StatelessWidget {
  const MediaQue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MobileDesktop(),
    );
  }
}

class MediaBuild extends StatefulWidget {
  const MediaBuild({Key? key}) : super(key: key);

  @override
  State<MediaBuild> createState() => _MediaBuildState();
}

class _MediaBuildState extends State<MediaBuild> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title:const Text('MediaQuery'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('$screenWidth, $screenHeight'),
      ),
    );
  }
}


class MobileDesktop extends StatefulWidget {
  const MobileDesktop({Key? key}) : super(key: key);

  @override
  State<MobileDesktop> createState() => _MobileDesktopState();
}

class _MobileDesktopState extends State<MobileDesktop> {

  bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 600;
  bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile'),
      centerTitle: true,
      ),
      body: Row(
        children: [
          if(isDesktop(context))
          Container(
            color: Colors.blue,
            width: 200,
            child: const Center(child: Text('SideBar'),),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              child: const Center(child: Text('Content'),),
            )
          )
        ],
      ),
    );
  }
}