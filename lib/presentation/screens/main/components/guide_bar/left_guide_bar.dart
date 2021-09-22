import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myblog/presentation/screens/main/components/guide_bar/left_guide_bar_point.dart';

class LeftGuideBar extends StatelessWidget {
  const LeftGuideBar({
    Key? key,
    required double? index,
  })  : _index = index,
        super(key: key);

  final double? _index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GuideBarPoint(
            page: 1,
            index: _index,
            title: "About",
          ),
          divLine(context),
          GuideBarPoint(
            page: 2,
            index: _index,
            title: "Activities",
          ),
          divLine(context),
          GuideBarPoint(
            page: 3,
            index: _index,
            title: "Projects",
          ),
        ],
      ),
    );
  }

  Container divLine(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16),
      width: 2,
      height: 80,
      color: Theme.of(context).primaryColorDark,
    );
  }

  Transform block(BuildContext context) {
    return Transform.rotate(
      angle: pi / 4,
      child: Container(
        margin: EdgeInsets.all(10),
        width: 15,
        height: 15,
        color: Theme.of(context).primaryColorDark,
      ),
    );
  }
}
