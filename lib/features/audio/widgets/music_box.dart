import 'package:flutter/material.dart';
import 'package:piton_tech_project/core/utils/image_demonstrator.dart';

class MusicBox extends StatelessWidget {
  /// A widget that shows title, description and photo of music.
  ///
  /// [onTap]: Callback function when the music box is tapped.
  ///
  /// [backgroundColor]: Background color of the music box.
  ///
  /// [height]: Height of the music box.
  ///
  /// [width]: Width of the music box.
  ///
  /// [elevation]: Elevation of the music box.
  ///
  /// [borderRadius]: Border radius of the music box.
  ///
  /// [padding]: Padding of the music box.
  ///
  /// [innerPadding]: Padding of the content.
  ///
  /// [image]: Image of music.
  ///
  /// [title]: The title of the music box.
  ///
  /// [titleStyle]: The style of the title.
  ///
  /// [description]: The description of the music box.
  ///
  /// [descriptionStyle]: The style of description.
  const MusicBox({
    super.key,
    this.onTap,
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

  final Function()? onTap;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? elevation;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? innerPadding;
  final ImageDemonstrator image;
  final String titleText;
  final TextStyle? titleStyle;
  final String descriptionText;
  final TextStyle? descriptionStyle;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
            width > 600
                ? Text(
                    descriptionText,
                    style: descriptionStyle ??
                        Theme.of(context).textTheme.displaySmall,
                  )
                : Row(
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
