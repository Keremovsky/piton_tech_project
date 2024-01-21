import 'package:flutter/material.dart';

class MusicBox extends StatelessWidget {
  const MusicBox({
    super.key,
    required this.onTap,
    this.backgroundColor,
    this.height,
    this.width,
    this.elevation,
    this.borderRadius,
    this.padding,
    this.innerPadding,
    required this.image,
    required this.titleText,
    this.titleStyle,
    required this.descriptionText,
    this.descriptionStyle,
  });

  final Function() onTap;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? elevation;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? innerPadding;
  final Image image;
  final String titleText;
  final TextStyle? titleStyle;
  final String descriptionText;
  final TextStyle? descriptionStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        child: Column(
          children: [
            image,
            const SizedBox(height: 10),
            Text(
              titleText,
              style: titleStyle ?? Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text(
                  descriptionText,
                  style: descriptionStyle ??
                      Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
