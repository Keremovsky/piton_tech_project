import 'package:flutter/material.dart';

class ImageDemonstrator extends StatelessWidget {
  /// Widget that display image.
  ///
  /// [imageProvider]: Image provider that will be shown.
  ///
  /// [height]: Height of image.
  ///
  /// [width]: Width of image.
  ///
  /// [padding]: Padding of the image.
  ///
  /// [borderRadius]: Border radius of image.
  const ImageDemonstrator({
    super.key,
    required this.imageProvider,
    this.height,
    this.width,
    this.padding = const EdgeInsets.only(),
    this.borderRadius = BorderRadius.zero,
  });

  final ImageProvider imageProvider;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: SizedBox(
          height: height,
          width: width,
          child: Image(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
