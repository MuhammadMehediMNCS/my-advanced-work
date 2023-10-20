import 'package:flutter/material.dart';

class LayoutBulid extends StatelessWidget {
  const LayoutBulid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LayoutWidget(),
    );
  }
}

class LayoutWidget extends StatefulWidget {
  const LayoutWidget({Key? key}) : super(key: key);

  @override
  State<LayoutWidget> createState() => _LayoutWidgetState();
}

class _LayoutWidgetState extends State<LayoutWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('With MediaQuery'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text('W: $width, H: $height'),
        ),
      ),
    );
  }
}

class LayoutWid extends StatefulWidget {
  const LayoutWid({Key? key}) : super(key: key);

  @override
  State<LayoutWid> createState() => _LayoutWidState();
}

class _LayoutWidState extends State<LayoutWid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('With Layout Builder'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth < 600) {
            return Container(
              color: Colors.red,
              child: const Center(child: Text('Content'),),
            );
          } else {
            return Row(
              children: [
                Container(
                  color: Colors.blue,
                  child: const Center(child: Text('SideBar'),),
                ),
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isSmall = constraints.maxWidth < 650;

                      return Container(
                        color: isSmall ? Colors.black : Colors.red,
                        child: Center(child: Text('${constraints.maxWidth}', style: const TextStyle(color: Colors.white),),),
                      );
                    }
                  )
                )
              ]
            );
          }



          // final width = constraints.maxWidth;
          // final height = constraints.maxHeight;

          // return Container(
          //   color: Colors.blue,
          //   child: Center(
          //     child: Text('W: $width, H: $height'),
          //   ),
          // );
        }
      ),
    );
  }
}