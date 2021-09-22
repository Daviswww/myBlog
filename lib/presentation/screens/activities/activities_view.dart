import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myblog/presentation/screens/activities/components/activities_canvas.dart';
import 'package:myblog/presentation/screens/activities/components/activities_sentence.dart';
import 'package:myblog/shared/images.dart';

class ActivitiesView extends StatefulWidget {
  const ActivitiesView({Key? key}) : super(key: key);

  @override
  _ActivitiesViewState createState() => _ActivitiesViewState();
}

class _ActivitiesViewState extends State<ActivitiesView> {
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
            child: ActivitiesSentence(a2: a2),
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
          ActivitiesCanvas(cut: cut, a1: a1),
        ],
      ),
    );
  }
}
