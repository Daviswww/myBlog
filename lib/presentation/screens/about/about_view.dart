import 'package:flutter/material.dart';
import 'package:myblog/presentation/screens/about/components/about_canvas.dart';
import 'package:myblog/presentation/screens/about/components/about_sentence.dart';
import 'package:myblog/shared/images.dart';

class AboutView extends StatefulWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  bool a1 = false;
  bool a2 = false;
  int cut = 10;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        a1 = true;
      });
    });
    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() {
        a2 = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 2 * (MediaQuery.of(context).size.width / 10),
            child: AboutSentence(a2: a2),
          ),
          AboutCanvas(cut: cut, a1: a1),
        ],
      ),
    );
  }
}
