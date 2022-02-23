import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';

class CircularTextWidget extends StatefulWidget {
  const CircularTextWidget({Key? key}) : super(key: key);

  @override
  State<CircularTextWidget> createState() => _CircularTextWidgetState();
}

class _CircularTextWidgetState extends State<CircularTextWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _angleAnimation;

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
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
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
            radius: 155,
            position: CircularTextPosition.inside,
          ),
        );
      },
    );
  }
}
