import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myblog/presentation/screens/about/about_view.dart';
import 'package:myblog/presentation/screens/activities/activities_view.dart';
import 'package:myblog/presentation/screens/home/home_view.dart';
import 'package:myblog/presentation/screens/main/components/guide_bar/left_guide_bar.dart';
import 'package:myblog/presentation/screens/project/project_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController _controller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  double? currentPageIndex = 0;

  bool a1 = false;
  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        currentPageIndex = _controller.page;
        if (currentPageIndex! >= 1) {
          a1 = true;
        } else {
          a1 = false;
        }
      });
    });
    try {
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          currentPageIndex = 0;
        });
      });
    } catch (_) {
      log("main animation error", name: "ERROR");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            scrollDirection: Axis.vertical,
            children: [
              HomeView(),
              AboutView(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              ActivitiesView(),
              ProjectView(),
            ],
          ),
          Positioned(
            top: 100,
            left: 50,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 1000),
              opacity: a1 ? 1 : 0,
              child: LeftGuideBar(
                index: currentPageIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
