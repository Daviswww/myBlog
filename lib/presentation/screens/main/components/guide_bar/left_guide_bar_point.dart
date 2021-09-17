import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuideBarPoint extends StatelessWidget {
  const GuideBarPoint({
    Key? key,
    required double? page,
    required double? index,
    required String title,
  })  : _index = index,
        _page = page,
        _title = title,
        super(key: key);

  final double? _index;
  final double? _page;
  final String? _title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: pi / 4,
              child: Container(
                margin: EdgeInsets.all(10),
                width: 15,
                height: 15,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            Transform.rotate(
              angle: pi / 4,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _page == _index ? 12 : 0,
                height: _page == _index ? 12 : 0,
                color: Theme.of(context).primaryColorLight,
                curve: _index == 0 ? Curves.easeIn : Curves.easeOut,
              ),
            ),
          ],
        ),
        SizedBox(width: 16),
        AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: _page == _index ? 1 : 0.5,
          child: Text(
            "$_title",
            style: GoogleFonts.shrikhand(
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
