import 'package:flutter/material.dart';
import 'package:piton_tech_project/core/utils/image_demonstrator.dart';
import 'package:piton_tech_project/themes/palette.dart';

class OnBoardView extends StatelessWidget {
  final String title;
  final String description;
  final ImageDemonstrator image;

  const OnBoardView({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        image,
        const SizedBox(height: 20),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const _CustomSizedBox(),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Palette.textGrey),
        ),
        const Spacer(flex: 5),
      ],
    );
  }
}

class _CustomSizedBox extends StatelessWidget {
  const _CustomSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 15);
  }
}
