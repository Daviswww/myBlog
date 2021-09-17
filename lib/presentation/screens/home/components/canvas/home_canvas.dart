import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myblog/presentation/screens/home/components/canvas/door_widget.dart';

class HomeCanvas extends StatefulWidget {
  const HomeCanvas({Key? key}) : super(key: key);

  @override
  _HomeCanvasState createState() => _HomeCanvasState();
}

class _HomeCanvasState extends State<HomeCanvas> {
  bool a1 = false;
  bool a2 = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      try {
        super.setState(() {
          a1 = !a1;
        });
      } catch (_) {}
    });
    Future.delayed(Duration(milliseconds: 2800), () {
      try {
        setState(() {
          a2 = !a2;
        });
      } catch (_) {}
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: DoorWidget(go: a2),
          ),
          Positioned(
            bottom: 0,
            child: DoorWidget(go: a2),
          ),
          AnimatedContainer(
            height: a1 ? 0 : 10,
            width: a1 ? MediaQuery.of(context).size.width : 0,
            duration: Duration(seconds: 2),
            color: Theme.of(context).primaryColor,
            curve: Curves.easeInCirc,
          ),
        ],
      ),
    );
  }
}
