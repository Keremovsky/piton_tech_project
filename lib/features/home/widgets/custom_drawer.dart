import 'package:flutter/material.dart';
import 'package:piton_tech_project/features/home/widgets/custom_drawer_button.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 35,
          bottom: 10,
          left: 10,
          right: 10,
        ),
        child: Column(
          children: [
            CustomDrawerButton(
              onTap: () {},
              text: "Profile",
              icon: Icons.person,
            ),
            const _CustomSizedBox(),
            CustomDrawerButton(
              onTap: () {},
              text: "Library",
              icon: Icons.video_library_sharp,
            ),
            const _CustomSizedBox(),
            CustomDrawerButton(
              onTap: () {},
              text: "Settings",
              icon: Icons.settings,
            ),
            const Spacer(),
            CustomDrawerButton(
              onTap: () {},
              text: "Sign Out",
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomSizedBox extends StatelessWidget {
  const _CustomSizedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}
