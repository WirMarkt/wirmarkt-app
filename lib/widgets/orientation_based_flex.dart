import 'package:flutter/material.dart';

@immutable
class OrientationBasedFlex extends StatelessWidget {
  final List<Widget> children;

  const OrientationBasedFlex({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    bool isScreenWide = orientation == Orientation.landscape;

    return Flex(
      direction: isScreenWide ? Axis.horizontal : Axis.vertical,
      children: children,
    );
  }
}
