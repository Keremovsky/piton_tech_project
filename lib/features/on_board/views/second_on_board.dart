import 'package:flutter/material.dart';
import 'package:piton_tech_project/core/constants/assets_constants.dart';
import 'package:piton_tech_project/core/constants/data_constants.dart';
import 'package:piton_tech_project/core/utils/image_demonstrator.dart';
import 'package:piton_tech_project/themes/palette.dart';
import 'package:piton_tech_project/themes/theme_constants.dart';

class SecondOnBoardView extends StatelessWidget {
  const SecondOnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        const ImageDemonstrator(
          height: ThemeConstants.onBoardPhotoHeight,
          imageProvider: AssetImage(AssetsConstants.secondOnBoard),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ThemeConstants.onBoardPhotoRadius),
            topRight: Radius.circular(ThemeConstants.onBoardPhotoRadius),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Podkes",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const _CustomSizedBox(),
        Text(
          DataConstants().onBoardText,
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
