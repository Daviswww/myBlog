import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final List data;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          child: Text(
            "${data[index]['title']}",
            softWrap: true,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: 400,
          child: Text(
            "${data[index]['text']}",
            softWrap: true,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
