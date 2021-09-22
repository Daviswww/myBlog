import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                text: "No Pain ",
                style: GoogleFonts.shrikhand(
                  fontSize: 50,
                ),
              ),
              TextSpan(
                text: "No Gain.",
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
