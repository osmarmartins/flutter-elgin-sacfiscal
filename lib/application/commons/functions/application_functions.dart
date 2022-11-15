import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Color? convertHexColorToColor(String? hexColor) {
  hexColor = hexColor!.replaceAll('#', '');
  if (hexColor.length == 6) {
    hexColor = 'FF' + hexColor;
  }
  if (hexColor.length == 8) {
    return Color(int.parse('0x$hexColor'));
  }
}

String converterDataParaString(
  DateTime? value, {
  String? format = 'dd/MM/yyyy HH:mm:ss',
}) {
  return DateFormat(format!).format(
    value!.toLocal(),
  );
}

String formatarDataStringISO(String? date) {
  return converterDataParaString(
    converterDataISOParaDateTime(date),
  );
}

DateTime converterDataISOParaDateTime(String? value) {
  return DateTime.parse(value!).toLocal();
}
