import 'package:flutter/material.dart';
import 'package:piton_tech_project/themes/palette.dart';

class LibraryView extends StatelessWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No Library",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.normal),
        ),
        const Icon(
          Icons.local_library_rounded,
          color: Palette.fullWhite,
          size: 40,
        )
      ],
    );
  }
}
