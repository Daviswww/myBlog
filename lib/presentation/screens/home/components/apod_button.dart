import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/presentation/screens/home/components/apod_widget.dart';
import 'package:myblog/presentation/screens/home/components/circular_text_widget.dart';

class ApodButton extends StatefulWidget {
  const ApodButton({
    Key? key,
  }) : super(key: key);

  @override
  State<ApodButton> createState() => _ApodButtonState();
}

class _ApodButtonState extends State<ApodButton> {
  double _opacityWidget = 0.0;
  double _opacityButton = 1.0;
  void _changeOpacity() {
    setState(() {
      _opacityWidget = _opacityWidget == 0 ? 1.0 : 0;
      _opacityButton = _opacityButton == 0 ? 1.0 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedOpacity(
          opacity: _opacityWidget,
          duration: Duration(milliseconds: 2000),
          child: ApodWidget(),
        ),
        AnimatedOpacity(
          opacity: _opacityButton,
          duration: Duration(milliseconds: 1000),
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularTextWidget(),
              MaterialButton(
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () {
                  _changeOpacity();
                },
                child: Text(
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
              ),
            ],
          ),
        ),
      ],
    );
  }
}
