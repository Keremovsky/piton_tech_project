import 'package:flutter/material.dart';
import 'package:piton_tech_project/themes/palette.dart';

class AudioVolumePainter extends CustomPainter {
  /// A painter that paints one volume component in the audio progress bar.
  ///
  /// [volumeSize]: Size of volume in specific position.
  ///
  /// [width]: Width of component.
  ///
  /// [y]: y position of center in the canvas.
  ///
  /// [isReached]: Bool value that shows if audio player has reached specific position in the audio progress bar.
  final double volumeSize;
  final double width;
  final double y;
  final bool isReached;

  AudioVolumePainter({
    required this.volumeSize,
    required this.width,
    required this.y,
    required this.isReached,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = isReached
        ? (Paint()..color = Palette.fullWhite)
        : (Paint()..color = Palette.volumeBarGrey);
    canvas.drawRect(
      Rect.fromCenter(center: Offset(0, y), width: width, height: volumeSize),
      paint,
    );
    canvas.drawCircle(Offset(0, y - ((volumeSize / 2))), width / 2, paint);
    canvas.drawCircle(Offset(0, y + (volumeSize / 2)), width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
