import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String toFormattedString(BuildContext context) {
    final String locale = Localizations.localeOf(context).toString();
    return DateFormat.yMMMd(locale).add_jm().format(this);
  }
}