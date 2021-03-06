import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myblog/application/theme/theme_bloc.dart';

class SwtichModeButton extends StatefulWidget {
  SwtichModeButton({Key? key}) : super(key: key);

  @override
  State<SwtichModeButton> createState() => _SwtichModeButtonState();
}

class _SwtichModeButtonState extends State<SwtichModeButton> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onPressed: () {
            BlocProvider.of<ThemeBloc>(context).add(
              ThemeChange(!state.isDark),
            );
          },
          icon: Icon(
            Icons.wb_sunny_outlined,
          ),
        );
      },
    );
  }
}
