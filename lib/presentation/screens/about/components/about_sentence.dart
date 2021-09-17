import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/infrastructure/data/about_data.dart';
import 'package:myblog/shared/images.dart';

class AboutSentence extends StatefulWidget {
  const AboutSentence({
    Key? key,
    required this.a2,
  }) : super(key: key);

  final bool a2;

  @override
  State<AboutSentence> createState() => _AboutSentenceState();
}

class _AboutSentenceState extends State<AboutSentence> {
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
            top: 180,
            left: 100,
            child: Row(
              children: [
                _sentence(context, "2018", AboutData.t1, true),
                SizedBox(width: 30),
                _sentence(context, "2019", AboutData.t1, false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MouseRegion _sentence(
      BuildContext context, String year, List data, bool _onHover) {
    return MouseRegion(
      onHover: (event) {},
      child: AnimatedContainer(
        padding: EdgeInsets.only(top: 20),
        alignment: Alignment.topLeft,
        height: 400,
        width: _onHover ? 600 : 40,
        duration: Duration(milliseconds: 1000),
        curve: Interval(0.0, 0.5),
        color: Theme.of(context).primaryColorDark,
        child: Stack(
          children: [
            Transform.rotate(
              angle: pi / 2,
              child: Text(
                "$year",
                style: GoogleFonts.staatliches(
                  fontSize: 25,
                ),
              ),
            ),
            // AnimatedOpacity(
            //   duration: Duration(milliseconds: 500),
            //   opacity: _onHover ? 1 : 0,
            //   child:
            // ),
            ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Container(
                  margin: EdgeInsets.only(left: 60, bottom: 16),
                  child: Text(
                    data[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomLine extends StatelessWidget {
  const BottomLine({
    Key? key,
    required this.a2,
  }) : super(key: key);

  final bool a2;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.centerLeft, children: [
      AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: 100,
        width: a2 ? MediaQuery.of(context).size.width : 0,
        color: Theme.of(context).shadowColor,
        curve: Curves.easeInExpo,
      ),
      Container(
        margin: EdgeInsets.only(left: 28),
        child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Hi there, ",
                style: GoogleFonts.shrikhand(
                  fontSize: 50,
                ),
              ),
              TextSpan(
                text: "I'm Davis",
                style: GoogleFonts.shrikhand(
                  fontSize: 50,
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
