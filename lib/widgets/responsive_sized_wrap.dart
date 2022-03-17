import 'package:flutter/material.dart';
import '../utils/logical_size_utils.dart';

class ResponsiveSizedWrap extends StatelessWidget {
  const ResponsiveSizedWrap({
    Key? key,
    required this.cards,
    this.padding = 8,
    this.columnCount = const {},
    this.wrapWidth = const {},
    this.aspectRatio = 1.0,
  }) : super(key: key);

  final List<Widget> cards;
  final double padding;
  final double aspectRatio;
  final Map<LogicalWidth, int> columnCount;
  final Map<LogicalWidth, double> wrapWidth;

  @override
  Widget build(BuildContext context) {
    var selectedColumnCount = 1;
    var selectedWrapWidth = 1.0;
    var logicalWidth = MediaQuery.of(context).logicalWidth;
    columnCount.entries.forEach((element) {
      if (element.key.index <= logicalWidth.index) {
        selectedColumnCount = element.value;
      }
    });
    wrapWidth.entries.forEach((element) {
      if (element.key.index <= logicalWidth.index) {
        selectedWrapWidth = element.value;
      }
    });
    return FractionallySizedBox(
      widthFactor: selectedWrapWidth,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: cards.map((card) {
            return FractionallySizedBox(
              widthFactor: 1.0 / selectedColumnCount,
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: card,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
