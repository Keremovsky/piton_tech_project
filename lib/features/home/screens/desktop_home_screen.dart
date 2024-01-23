import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:piton_tech_project/core/constants/router_constants.dart';
import 'package:piton_tech_project/core/custom_icons_icons.dart';
import 'package:piton_tech_project/features/home/widgets/custom_drawer.dart';
import 'package:piton_tech_project/features/home/widgets/views/discover_view.dart';
import 'package:piton_tech_project/features/home/widgets/views/library_view.dart';
import 'package:piton_tech_project/features/home/widgets/views/profile_view.dart';
import 'package:piton_tech_project/features/notification/service/notification_service.dart';
import 'package:piton_tech_project/themes/palette.dart';
import 'package:piton_tech_project/themes/theme_constants.dart';

class DesktopHomeScreen extends ConsumerStatefulWidget {
  const DesktopHomeScreen({super.key});

  @override
  ConsumerState<DesktopHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<DesktopHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _navigateToScreen(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        key: _scaffoldKey,
        body: SafeArea(
          child: Row(
            children: [
              const SizedBox(
                width: 300,
                child: CustomDrawer(
                  color: Palette.background,
                  padding: EdgeInsets.only(
                    top: 15,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 55,
                      child: Row(
                        children: [
                          const Spacer(),
                          Text(
                            "Podkes",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              context.pushNamed(
                                  RouterConstants.notificationScreenName);
                            },
                            icon: Consumer(
                              builder: (context, ref, child) {
                                return ref
                                    .watch(notificationStreamProvider)
                                    .when(
                                  data: (data) {
                                    for (final n in data) {
                                      if (n.isSeen == false) {
                                        return const Badge(
                                            child: Icon(CustomIcons.notify_no));
                                      }
                                    }
                                    return const Icon(CustomIcons.notify_no);
                                  },
                                  error: (error, stackTrace) {
                                    return const SizedBox();
                                  },
                                  loading: () {
                                    return const SizedBox();
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const [
                          Padding(
                            padding: ThemeConstants.screenPadding,
                            child: DiscoverView(),
                          ),
                          Padding(
                            padding: ThemeConstants.screenPadding,
                            child: LibraryView(),
                          ),
                          ProfileView(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => _navigateToScreen(index),
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library_sharp),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
