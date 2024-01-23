import 'package:flutter/material.dart';
import 'package:piton_tech_project/core/constants/assets_constants.dart';
import 'package:piton_tech_project/features/home/widgets/user_profile_header.dart';
import 'package:piton_tech_project/themes/palette.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserProfileHeader(
          profilePic: AssetsConstants.profilePic,
          backgroundPic: AssetsConstants.backgroundPic,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            left: 20,
            right: 10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Kerem Okumuş",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_outlined,
                    color: Palette.textGrey,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "01/02/2024",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Palette.textGrey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
