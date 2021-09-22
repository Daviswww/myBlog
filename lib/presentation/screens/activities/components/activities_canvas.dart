import 'package:flutter/material.dart';

class ActivitiesCanvas extends StatelessWidget {
  const ActivitiesCanvas({
    Key? key,
    required this.cut,
    required this.a1,
  }) : super(key: key);

  final int cut;
  final bool a1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        for (int i = 2; i < cut; i++)
          Positioned(
            left: i * (MediaQuery.of(context).size.width / cut),
            child: AnimatedContainer(
              curve: Curves.easeOutQuad,
              duration: Duration(milliseconds: 1500),
              color: Theme.of(context).primaryColor,
              width: a1 ? 0 : MediaQuery.of(context).size.width / cut,
              height: MediaQuery.of(context).size.height,
            ),
          ),
      ],
    );
  }
}
