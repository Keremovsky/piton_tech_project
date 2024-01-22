import 'package:flutter/material.dart';
import 'package:piton_tech_project/core/constants/assets_constants.dart';
import 'package:piton_tech_project/core/constants/data_constants.dart';
import 'package:piton_tech_project/core/utils/image_demonstrator.dart';
import 'package:piton_tech_project/themes/palette.dart';
import 'package:piton_tech_project/themes/theme_constants.dart';

class FirstOnBoardView extends StatelessWidget {
  const FirstOnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        ImageDemonstrator(
          height: ThemeConstants.onBoardPhotoHeight,
          imageProvider: const AssetImage(AssetsConstants.firstOnBoard),
          borderRadius: BorderRadius.circular(50),
        ),
        const SizedBox(height: 20),
        Text(
          "Start Adventure",
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
