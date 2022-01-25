import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/application/apod/apod_bloc.dart';
import 'package:myblog/presentation/screens/home/components/ball.dart';
import 'package:myblog/shared/colors.dart';

class ApodWidget extends StatelessWidget {
  const ApodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApodBloc, ApodState>(
      builder: (context, state) {
        if (state is ApodStateSuccess) {
          return Container(
            padding: EdgeInsets.all(16.0),
            width: 330,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColorDark,
                  blurRadius: 4,
                  offset: Offset(4, 8), // Shadow position
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  "${state.apodModel.url}",
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      width: 300,
                      height: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Ball(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                Center(
                  child: Text(
                    state.apodModel.title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.pattaya(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
