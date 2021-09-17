import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/presentation/screens/home/components/ball_widget.dart';
import 'package:myblog/presentation/screens/home/components/canvas/home_canvas.dart';
import 'package:myblog/presentation/screens/home/components/link_buttons.dart';
import 'package:myblog/presentation/screens/home/components/switch_mode_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 30,
            right: 20,
            child: SwtichModeButton(),
          ),
          Text(
            "Hello",
            style: GoogleFonts.pattaya(
              fontSize: 40,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Theme.of(context).primaryColorDark,
                  offset: Offset(5.0, 2.0),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 150,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          Positioned(
            right: 16,
            bottom: 12,
            child: Text(
              "Davis1997",
              style: GoogleFonts.libreBarcode39(
                fontSize: 40,
              ),
            ),
          ),
          Positioned(
            right: 8,
            child: LinkButtons(),
          ),
          HomeCanvas(),
        ],
      ),
    );
  }
}
