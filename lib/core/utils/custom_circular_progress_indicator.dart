import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  /// Custom circular progress indicator.
  ///
  /// [size]: Size of progress indicator.
  ///
  /// [color]: Color of progress indicator.
  const CustomCircularProgressIndicator({
    super.key,
    required this.size,
    required this.color,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator(
          color: color,
        ),
      ),
    );
  }
}
