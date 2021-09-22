import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/infrastructure/data/about_data.dart';
import 'package:myblog/presentation/screens/activities/components/bottom_line.dart';
import 'package:myblog/shared/images.dart';

class ActivitiesSentence extends StatefulWidget {
  const ActivitiesSentence({
    Key? key,
    required this.a2,
  }) : super(key: key);

  final bool a2;

  @override
  State<ActivitiesSentence> createState() => _ActivitiesSentenceState();
}

class _ActivitiesSentenceState extends State<ActivitiesSentence> {
  late final PageController _controller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int currentPageIndex = 0;
  bool a3 = false;
  bool a4 = false;
  @override
  void initState() {
    super.initState();

    _controller.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColorLight,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: BottomLine(a2: widget.a2),
          ),
          Positioned(
            top: 100,
            left: 100,
            child: Text(
              "Activities and Societies",
              style: GoogleFonts.shrikhand(
                fontSize: 28,
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 120,
            child: SizedBox(
              height: 400,
              width: 650,
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: [
                  _sentence(context, "2021", AboutData.t4, true),
                  _sentence(context, "2020", AboutData.t3, true),
                  _sentence(context, "2019", AboutData.t2, true),
                  _sentence(context, "2018", AboutData.t1, true),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: a3 ? 150 : 0,
                  height: a3 ? 150 : 0,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    shape: BoxShape.circle,
                  ),
                ),
                MouseRegion(
                  onHover: (event) {
                    setState(() {
                      a3 = true;
                    });
                  },
                  onExit: (event) {
                    setState(() {
                      a3 = false;
                    });
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.all(20),
                    child: IconButton(
                      onPressed: () {
                        _controller.animateToPage(
                          ++currentPageIndex % 4,
                          duration: Duration(milliseconds: 1000),
                          curve: Curves.easeInCirc,
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward_rounded,
                        size: 100,
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack _sentence(BuildContext context, String year, List data, bool _onHover) {
    return Stack(
      children: [
        Transform.rotate(
          angle: pi / 2,
          child: Container(
            color: Theme.of(context).hoverColor,
            padding: EdgeInsets.only(left: 8, right: 8),
            margin: EdgeInsets.all(16),
            child: Text(
              "$year",
              style: GoogleFonts.staatliches(
                fontSize: 25,
              ),
            ),
          ),
        ),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return Container(
              margin: EdgeInsets.only(left: 100, bottom: 30),
              child: Text(
                data[index],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
