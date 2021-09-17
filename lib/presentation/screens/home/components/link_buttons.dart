import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myblog/shared/icons.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class LinkButtons extends StatefulWidget {
  const LinkButtons({Key? key}) : super(key: key);

  @override
  State<LinkButtons> createState() => _LinkButtonsState();
}

class _LinkButtonsState extends State<LinkButtons> {
  bool a1 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        a1 = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        linkButton(github_icon, "https://github.com/Daviswww"),
        SizedBox(height: 16),
        linkButton(facebook_icon, "https://www.facebook.com/ho861206"),
        SizedBox(height: 16),
        linkButton(instagram_icon, "https://www.instagram.com/hdavisllll/"),
        SizedBox(height: 16),
        linkButton(globe_icon, "https://chucs.github.io/"),
      ],
    );
  }

  MaterialButton linkButton(String icon, String link) {
    return MaterialButton(
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: SvgPicture.asset(
        icon,
        width: 23,
        height: 23,
      ),
      onPressed: () {
        html.window.open(link, 'new tab');
      },
    );
  }
}
