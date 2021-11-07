import 'package:flutter/cupertino.dart';

import 'dart:async';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScanPageState();
}

class ScanPageState extends State<ScanPage> {
  ScanResult? scanResult;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      setState(() {});
    }).then((value) => _scan());
  }

  @override
  Widget build(BuildContext context) {
    final scanResult = this.scanResult;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Scan Resultat'),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            if (scanResult != null)
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text('Resultat'),
                      subtitle: Text(scanResult.type.toString()),
                    ),
                    ListTile(
                      title: const Text('Roher Inhalt'),
                      subtitle: Text(scanResult.rawContent),
                    ),
                  ],
                ),
              ),
          ],
        ),
      );

  }

  Future<void> _scan() async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          autoEnableFlash: true,
        ),
      );
      setState(() => scanResult = result);
      if (result.type == ResultType.Barcode) {
        Navigator.of(context).pop(result);
      } else if (result.type == ResultType.Cancelled) {
        Navigator.of(context).pop(result);
      }
    } on PlatformException catch (e) {
      setState(() {
        scanResult = ScanResult(
          type: ResultType.Error,
          format: BarcodeFormat.unknown,
          rawContent: e.code == BarcodeScanner.cameraAccessDenied
              ? 'The user did not grant the camera permission!'
              : 'Unknown error: $e',
        );
      });
    }
  }
}
