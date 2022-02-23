import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/application/apod/apod_bloc.dart';

class ApodButton extends StatelessWidget {
  const ApodButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      onPressed: () {
        BlocProvider.of<ApodBloc>(context).add(ChangeApodEvent());
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
    );
  }
}
