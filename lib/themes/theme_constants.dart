import 'package:flutter/material.dart';
import 'package:piton_tech_project/themes/palette.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ThemeConstants {
  static const screenPadding = EdgeInsets.only(top: 10, left: 15, right: 15);
  static const notificationPadding = 8.0;
  static const onBoardPhotoHeight = 300.0;
  static const onBoardPhotoRadius = 100.0;
  static const dotEffect = ExpandingDotsEffect(
    dotHeight: 8,
    dotWidth: 8,
    activeDotColor: Palette.onBoardPurple,
    dotColor: Palette.inactiveDot,
  );

  final textFieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(15),
  );
}
