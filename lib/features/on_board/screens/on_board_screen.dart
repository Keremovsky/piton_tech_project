import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:piton_tech_project/core/constants/assets_constants.dart';
import 'package:piton_tech_project/core/constants/data_constants.dart';
import 'package:piton_tech_project/core/constants/router_constants.dart';
import 'package:piton_tech_project/core/utils/custom_button.dart';
import 'package:piton_tech_project/core/utils/image_demonstrator.dart';
import 'package:piton_tech_project/features/on_board/widget/on_board_view.dart';
import 'package:piton_tech_project/themes/palette.dart';
import 'package:piton_tech_project/themes/theme_constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: ThemeConstants.screenPadding,
          child: Stack(
            children: [
              PageView(
                controller: _pageController,
                children: [
                  OnBoardView(
                    title: "Start Adventure",
                    description: DataConstants().onBoardText,
                    image: ImageDemonstrator(
                      height: ThemeConstants.onBoardPhotoHeight,
                      imageProvider:
                          const AssetImage(AssetsConstants.firstOnBoard),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  OnBoardView(
                    title: "Podkes",
                    description: DataConstants().onBoardText,
                    image: const ImageDemonstrator(
                      height: ThemeConstants.onBoardPhotoHeight,
                      imageProvider: AssetImage(AssetsConstants.secondOnBoard),
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(ThemeConstants.onBoardPhotoRadius),
                        topRight:
                            Radius.circular(ThemeConstants.onBoardPhotoRadius),
                      ),
                    ),
                  ),
                  OnBoardView(
                    title: "Welcome!",
                    description: DataConstants().onBoardText,
                    image: const ImageDemonstrator(
                      height: ThemeConstants.onBoardPhotoHeight,
                      imageProvider: AssetImage(AssetsConstants.lastOnBoard),
                      borderRadius: BorderRadius.only(
                        topLeft:
                            Radius.circular(ThemeConstants.onBoardPhotoRadius),
                        bottomRight:
                            Radius.circular(ThemeConstants.onBoardPhotoRadius),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 70,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: ThemeConstants.dotEffect,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                heightFactor: 10,
                child: CustomButton(
                  onTap: () {
                    if (_pageController.page == 2) {
                      context.pushNamed(RouterConstants.homeScreenName);
                    }
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.ease,
                    );
                  },
                  height: 70,
                  width: 70,
                  borderRadius: BorderRadius.circular(20),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Palette.onBoardPurple,
                    size: 32,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
