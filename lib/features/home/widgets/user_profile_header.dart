import 'package:flutter/material.dart';
import 'package:piton_tech_project/themes/palette.dart';

class UserProfileHeader extends StatelessWidget {
  final String profilePic;
  final String backgroundPic;

  const UserProfileHeader({
    super.key,
    required this.profilePic,
    required this.backgroundPic,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        SizedBox(height: height * 0.15 + 50),
        Container(
          height: height * 0.15,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundPic),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          left: 20,
          bottom: 0,
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(profilePic),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: Palette.background,
                width: 6,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
