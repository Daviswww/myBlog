import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:myblog/application/apod/apod_bloc.dart';

class CircularTextWidget extends StatefulWidget {
  const CircularTextWidget({Key? key}) : super(key: key);

  @override
  State<CircularTextWidget> createState() => _CircularTextWidgetState();
}

class _CircularTextWidgetState extends State<CircularTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _angleAnimation;
  late Animation<double> _radiusAnimation;
  late bool radius = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 300),
      vsync: this,
    )..repeat();

    _angleAnimation = Tween<double>(
      begin: 0,
      end: 360,
    ).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _radiusAnimation = Tween<double>(
      begin: 155,
      end: 200,
    ).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApodBloc, ApodState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is ApodStateSuccess) {
          setState(() {
            radius = true;
          });
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
            angle: _angleAnimation.value,
            child: CircularText(
              children: [
                TextItem(
                  text: Text(
                    "welcome welcome welcome welcome".toUpperCase(),
                    style: TextStyle(
                      fontSize: 28,
                      color: Theme.of(context).primaryColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  space: 11,
                  startAngle: -90,
                  startAngleAlignment: StartAngleAlignment.center,
                  direction: CircularTextDirection.clockwise,
                ),
              ],
              radius: _radiusAnimation.value,
              position: CircularTextPosition.inside,
            ),
          );
        },
      ),
    );
  }
}
