import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/presentation/screens/about/about_view.dart';

class RightTopBlock extends StatelessWidget {
  const RightTopBlock({
    Key? key,
    required Animation<double> width2,
    required this.widget,
  })  : _width2 = width2,
        super(key: key);

  final Animation<double> _width2;
  final AboutView widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width2.value,
      height: widget.height / 2,
      color: Colors.white,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "I’m currently working on a Course!",
            style: GoogleFonts.staatliches(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "I’m currently learning everything",
            style: GoogleFonts.staatliches(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Goals: Contribute more to Open Source projects",
            style: GoogleFonts.staatliches(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Fun fact: I love to travel and exercise",
            style: GoogleFonts.staatliches(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
