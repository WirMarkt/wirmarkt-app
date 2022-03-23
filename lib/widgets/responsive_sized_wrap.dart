import 'package:flutter/material.dart';
import '../utils/logical_size_utils.dart';

class ResponsiveSizedWrap extends StatelessWidget {
  const ResponsiveSizedWrap({
    Key? key,
    required this.children,
    this.padding = 8,
    this.columnCount = const {},
    this.aspectRatio = 1.0,
  }) : super(key: key);

  final List<Widget> children;
  final double padding;
  final double aspectRatio;
  final Map<LogicalWidth, int> columnCount;

  @override
  Widget build(BuildContext context) {
    var selectedColumnCount = 1;
    var logicalWidth = MediaQuery.of(context).logicalWidth;
    columnCount.entries.forEach((element) {
      if (element.key <= logicalWidth) {
        selectedColumnCount = element.value;
      }
    });
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: children.map((card) {
          return FractionallySizedBox(
            widthFactor: 1.0 / selectedColumnCount,
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: card,
            ),
          );
        }).toList(),
      ),
    );
  }
}
