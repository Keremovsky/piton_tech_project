import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:piton_tech_project/core/constants/router_constants.dart';
import 'package:piton_tech_project/features/home/screens/home_screen.dart';
import 'package:piton_tech_project/features/audio/screens/music_screen.dart';
import 'package:piton_tech_project/features/notification/screens/notification_screen.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: RouterConstants.homeScreenPath,
        name: RouterConstants.homeScreenName,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: HomeScreen(),
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
    ],
  );
}
