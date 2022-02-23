import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/application/apod/apod_bloc.dart';
import 'package:myblog/presentation/screens/home/components/apod_button.dart';
import 'package:myblog/presentation/screens/home/components/apod_widget.dart';
import 'package:myblog/presentation/screens/home/components/canvas/home_canvas.dart';
import 'package:myblog/presentation/screens/home/components/circular_text_widget.dart';
import 'package:myblog/presentation/screens/home/components/link_buttons.dart';
import 'package:myblog/presentation/screens/home/components/switch_mode_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 30,
              left: 30,
              child: Text(
                "DAVIS",
                style: TextStyle(
                  fontSize: 21,
                  fontFamily: "Shippori Mincho",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 20,
              child: SwtichModeButton(),
            ),
            CircularTextWidget(),
            BlocBuilder<ApodBloc, ApodState>(
              builder: (context, state) {
                if (state is ApodStateSuccess) {
                  return ApodWidget();
                }
                return ApodButton();
              },
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
      ),
    );
  }
}
