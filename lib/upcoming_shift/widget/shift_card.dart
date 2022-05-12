import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/data.dart';
import '../../generated/l10n.dart';

@immutable
class ShiftCard extends StatelessWidget {
  final String shiftName;
  final DateTime shiftEnd;
  final DateTime shiftStart;
  final String shiftUrl;
  final AttendanceState? shiftState;

  const ShiftCard({
    required this.shiftName,
    required this.shiftEnd,
    required this.shiftStart,
    required this.shiftUrl,
    this.shiftState,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String languageCode = Localizations.localeOf(context).languageCode;
    var dateFormat = DateFormat.yMMMMd(languageCode);
    var timeFormat = DateFormat.Hm(languageCode);

    var fromToLabel = "${timeFormat.format(shiftStart)}"
        " - "
        "${timeFormat.format(shiftEnd)}";

    DateTime now = DateTime.now();
    DateTime dayAfterTomorrow = DateTime(now.year, now.month, now.day + 2);
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    DateTime today = DateTime(now.year, now.month, now.day);

    String dateLabel;

    if (shiftStart.isBefore(tomorrow) && shiftStart.isAfter(today)) {
      dateLabel = S.of(context).today;
    } else if (shiftStart.isBefore(dayAfterTomorrow) &&
        shiftStart.isAfter(tomorrow)) {
      dateLabel = S.of(context).tomorrow;
    } else {
      dateLabel = dateFormat.format(shiftStart);
    }

    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.date_range),
          title: Text(shiftName),
          isThreeLine: true,
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(dateLabel),
                  const Spacer(),
                  Text(fromToLabel),
                ],
              ),
              if (shiftState != null)
                Text(_getShiftLabel(S.of(context), shiftState!)),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              child: Text(S.of(context).manage),
              onPressed: _launchShiftEditorInBrowser,
            ),
            const SizedBox(width: 8),
          ],
        ),
        // const SizedBox(height: 8),
      ],
    ));
  }

  void _launchShiftEditorInBrowser() =>
      launchUrl(AppConfig.get().memberManagementUri.resolve(shiftUrl));

  String _getShiftLabel(S dict, AttendanceState shiftState) {
    switch (shiftState) {
      case AttendanceState.pending:
        return dict.pending;
      case AttendanceState.done:
        return dict.done;
      case AttendanceState.cancelled:
        return dict.cancelled;
      case AttendanceState.missed:
        return dict.missed;
      case AttendanceState.missedExcused:
        return dict.missedExcused;
      case AttendanceState.lookingForStandIn:
        return dict.lookingForStandIn;
    }
  }
}
