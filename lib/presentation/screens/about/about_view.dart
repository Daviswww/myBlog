import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myblog/presentation/screens/about/components/about_canvas.dart';
import 'package:myblog/presentation/screens/about/components/about_sentence.dart';
import 'package:myblog/shared/images.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  bool a1 = false;
  bool a2 = false;
  int cut = 10;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      try {
        setState(() {
          a1 = true;
        });
      } catch (_) {}
    });
    Future.delayed(Duration(milliseconds: 1500), () {
      try {
        setState(() {
          a2 = true;
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
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 2 * (MediaQuery.of(context).size.width / 10),
            child: AboutSentence(a2: a2),
          ),
          Positioned(
            left: 50,
            bottom: 50,
            child: Transform.rotate(
              angle: pi / 4 * 5,
              child: Icon(
                Icons.arrow_back_outlined,
                size: 150,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          ),
          AboutCanvas(cut: cut, a1: a1),
        ],
      ),
    );
  }
}
