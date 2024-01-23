import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  /// A customizable button widget.
  ///
  /// [onTap]: Callback function when the button is tapped.
  ///
  /// [backgroundColor]: Background color of the button.
  ///
  /// [height]: Height of the button.
  ///
  /// [width]: Width of the button.
  ///
  /// [elevation]: Elevation of the button.
  ///
  /// [borderRadius]: Border radius of the button.
  ///
  /// [padding]: Padding of the button.
  ///
  /// [innerPadding]: Padding of the child.
  ///
  /// [isState]: Bool value to help change child based on the state.
  ///
  /// [child]: The default content of the button.
  ///
  /// [stateChild]: The content of the button for false state.
  const CustomButton({
    super.key,
    required this.onTap,
    this.backgroundColor,
    this.height,
    this.width,
    this.elevation,
    this.borderRadius,
    this.padding,
    this.innerPadding,
    this.isState = true,
    required this.child,
    this.stateChild,
  });

  final Function() onTap;
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final double? elevation;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? innerPadding;
  final bool isState;
  final Widget child;
  final Widget? stateChild;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(),
      child: SizedBox(
        height: height,
        width: width,
        child: Card(
          color: backgroundColor,
          elevation: elevation ?? 0,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? const BorderRadius.only(),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: borderRadius,
            child: Padding(
              padding: innerPadding ?? const EdgeInsets.only(),
              child: Center(child: isState ? child : stateChild),
            ),
          ),
        ),
      ),
    );
  }
}
