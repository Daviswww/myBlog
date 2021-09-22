import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myblog/infrastructure/data/project_data.dart';
import 'package:myblog/presentation/screens/project/components/projects_card.dart';

class ProjectsList extends StatefulWidget {
  const ProjectsList({
    Key? key,
  }) : super(key: key);

  @override
  State<ProjectsList> createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {
  int item = 0;
  List data = ProjectData.data;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {
      _timer = Timer.periodic(Duration(seconds: 5), (timer) {
        try {
          setState(() {
            item = (item + 1) % data.length;
          });
        } catch (_) {}
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        reverse: true,
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (BuildContext ctxt, int index) {
          return AnimatedContainer(
            alignment: Alignment.topLeft,
            duration: Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            width: index == item ? 600 : 50,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: IconButton(
                    icon: Icon(Icons.stars_rounded),
                    color: Colors.white,
                    onPressed: () {
                      setState(
                        () {
                          if (item == index) {
                            item = -1;
                          } else {
                            item = index;
                          }
                        },
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 50,
                  child: ProjectCard(data: data, index: index),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(
                72,
                116,
                140,
                0.55 + index * 0.05,
              ),
            ),
          );
        },
      ),
    );
  }
}
