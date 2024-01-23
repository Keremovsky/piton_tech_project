import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:piton_tech_project/core/constants/key_constants.dart';
import 'package:piton_tech_project/core/constants/router_constants.dart';
import 'package:piton_tech_project/core/services/storage_service.dart';
import 'package:piton_tech_project/features/home/screens/desktop_home_screen.dart';
import 'package:piton_tech_project/features/home/screens/mobile_home_screen.dart';
import 'package:piton_tech_project/features/audio/screens/music_screen.dart';
import 'package:piton_tech_project/features/on_board/screens/on_board_screen.dart';
import 'package:piton_tech_project/features/notification/screens/notification_screen.dart';
import 'package:piton_tech_project/responsive_layout.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: RouterConstants.homeScreenPath,
        name: RouterConstants.homeScreenName,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: ResponsiveLayout(
              mobileBody: MobileHomeScreen(),
              desktopBody: DesktopHomeScreen(),
            ),
          );
        },
      ),
      GoRoute(
        path: RouterConstants.notificationScreenPath,
        name: RouterConstants.notificationScreenName,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: NotificationScreen(),
          );
        },
      ),
      GoRoute(
        path: RouterConstants.musicScreenPath,
        name: RouterConstants.musicScreenName,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: MusicScreen(),
          );
        },
      ),
      GoRoute(
        path: RouterConstants.onBoardScreenPath,
        name: RouterConstants.onBoardScreenName,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: OnBoardScreen(),
          );
        },
      ),
    ],
    redirect: (context, state) {
      // get showOnBoard variable from local
      final StorageService storageService = StorageService();
      final showOnBoard =
          storageService.getData(KeyConstants.showOnBoard) as bool? ?? true;

      // control if user opened app for the first time
      if (showOnBoard) {
        storageService.setBool(KeyConstants.showOnBoard, false);
        return RouterConstants.onBoardScreenPath;
      } else {
        return null;
      }
    },
  );
}
