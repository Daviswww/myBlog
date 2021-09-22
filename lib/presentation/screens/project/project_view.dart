import 'package:flutter/material.dart';
import 'package:myblog/presentation/screens/project/components/ball.dart';
import 'package:myblog/presentation/screens/project/components/projects_list.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  _ProjectViewState createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  bool a1 = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1000), () {
      try {
        setState(() {
          a1 = true;
        });
      } catch (_) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).primaryColor,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: ProjectsList(),
          ),
          Positioned(
            bottom: 30,
            left: 100,
            child: Ball(),
          ),
        ],
      ),
    );
  }
}
