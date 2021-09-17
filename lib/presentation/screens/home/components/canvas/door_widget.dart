import 'package:flutter/material.dart';

class DoorWidget extends StatelessWidget {
  const DoorWidget({
    Key? key,
    required this.go,
  }) : super(key: key);

  final bool go;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: MediaQuery.of(context).size.width,
      duration: Duration(milliseconds: 500),
      height: go ? 0 : MediaQuery.of(context).size.height / 2,
      color: Theme.of(context).primaryColorDark,
      curve: Curves.bounceOut,
    );
  }
}
