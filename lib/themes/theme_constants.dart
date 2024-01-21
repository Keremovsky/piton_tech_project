import 'package:flutter/material.dart';

class ThemeConstants {
  static const screenPadding = EdgeInsets.only(top: 10, left: 15, right: 15);
  static const notificationPadding = 8.0;

  final textFieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(15),
  );
}
