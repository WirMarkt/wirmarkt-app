import 'package:flutter/material.dart';
import 'package:scan/scan.dart';
import 'package:wir_markt/wm_design.dart';

class ScanCodePage extends StatefulWidget {
  final Function(String)? onCapture;

  final String explanation;

  final String title;

  const ScanCodePage(
      {Key? key,
      this.onCapture,
      required this.explanation,
      required this.title})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => ScanCodePageState();
}

class ScanCodePageState extends State<ScanCodePage> {
  ScanController controller = ScanController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(widget.explanation,
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ),
          Expanded(
            child: ScanView(
              controller: controller,
              scanAreaScale: .9,
              scanLineColor: WMDesign.orange,
              onCapture: widget.onCapture,
            ),
          ),
        ],
      ),
    );
  }
}
