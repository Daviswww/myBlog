import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myblog/presentation/screens/about/components/right_top_block.dart';
import 'package:myblog/shared/images.dart';

class AboutView extends StatefulWidget {
  const AboutView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _width1;
  late Animation<double> _width2;
  late Animation<double> _height2;
  late Animation<double> _opacity1;
  late Animation<double> _opacity2;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _width1 = new Tween<double>(
      begin: 0,
      end: widget.width / 2,
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(
          0.000,
          0.200,
          curve: Curves.ease,
        ),
      ),
    );
    _width2 = new Tween<double>(
      begin: 0.0,
      end: widget.width / 2,
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(
          0.200,
          0.300,
          curve: Curves.ease,
        ),
      ),
    );
    _height2 = new Tween<double>(
      begin: 0,
      end: widget.height / 2,
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(
          0.300,
          0.400,
          curve: Curves.ease,
        ),
      ),
    );
    _opacity1 = new Tween<double>(
      begin: 0.0,
      end: 1,
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(
          0.300,
          1.000,
          curve: Curves.ease,
        ),
      ),
    );
    _opacity2 = new Tween<double>(
      begin: 0.0,
      end: 1,
    ).animate(
      new CurvedAnimation(
        parent: _controller,
        curve: new Interval(
          0.400,
          0.500,
          curve: Curves.ease,
        ),
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: Container(
                      width: _width1.value,
                      height: widget.height,
                      color: Theme.of(context).shadowColor,
                      child: Opacity(
                        opacity: _opacity1.value,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 150,
                              bottom: 50,
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).backgroundColor,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 40,
                              top: 100,
                              child: Container(
                                width: 2,
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                color: Theme.of(context).backgroundColor,
                              ),
                            ),
                            Positioned(
                              right: 100,
                              top: 250,
                              child: Image.asset(
                                my_avatar,
                                fit: BoxFit.contain,
                                width: 300,
                                height: 300,
                              ),
                            ),
                            Positioned(
                              right: 16,
                              top: 8,
                              child: Text(
                                "MY BLOG",
                                style: GoogleFonts.staatliches(
                                  fontSize: 40,
                                  color:
                                      Theme.of(context).toggleableActiveColor,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 100,
                              right: 200,
                              child: Text(
                                "Hi there, I'm Davis",
                                style: GoogleFonts.staatliches(
                                  fontSize: 40,
                                  color:
                                      Theme.of(context).toggleableActiveColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: widget.width / 2,
                    child: RightTopBlock(
                      width2: _width2,
                      widget: widget,
                    ),
                  ),
                  Positioned(
                    left: widget.width / 2,
                    bottom: 0,
                    child: Container(
                      width: widget.width / 2,
                      height: _height2.value,
                      child: Image.asset(
                        toy_1,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
