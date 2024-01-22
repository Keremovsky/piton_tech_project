import 'package:flutter/material.dart';

class CustomDrawerButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final TextStyle? textStyle;
  final IconData icon;

  const CustomDrawerButton({
    super.key,
    required this.onTap,
    required this.text,
    this.textStyle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(icon, size: 32),
            const SizedBox(width: 15),
            Text(
              text,
              style: textStyle ??
                  Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
