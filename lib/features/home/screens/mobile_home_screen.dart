import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:piton_tech_project/core/constants/router_constants.dart';
import 'package:piton_tech_project/features/home/widgets/views/discover_view.dart';
import 'package:piton_tech_project/features/home/widgets/views/library_view.dart';
import 'package:piton_tech_project/features/notification/service/notification_service.dart';
import 'package:piton_tech_project/themes/palette.dart';
import 'package:piton_tech_project/themes/theme_constants.dart';
import 'package:piton_tech_project/core/custom_icons_icons.dart';
import 'package:piton_tech_project/features/home/widgets/custom_drawer.dart';

class MobileHomeScreen extends ConsumerStatefulWidget {
  const MobileHomeScreen({super.key});

  @override
  ConsumerState<MobileHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<MobileHomeScreen> {
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
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          title: Text(
            "Podkes",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                context.pushNamed(RouterConstants.notificationScreenName);
              },
              icon: Consumer(
                builder: (context, ref, child) {
                  return ref.watch(notificationStreamProvider).when(
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
        drawer: const Drawer(
          child: CustomDrawer(
            color: Palette.background,
            padding: EdgeInsets.only(
              top: 35,
              bottom: 10,
              left: 10,
              right: 10,
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: ThemeConstants.screenPadding,
            child: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                DiscoverView(),
                LibraryView(),
                Text("Profile"),
              ],
            ),
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
