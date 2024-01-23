import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piton_tech_project/core/services/storage_service.dart';
import 'package:piton_tech_project/router.dart';
import 'package:piton_tech_project/themes/palette.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize storage service
  StorageService();

  final router = AppRouter().router;
  runApp(
    ProviderScope(child: MyApp(router: router)),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Piton Tech Project',
      debugShowCheckedModeBanner: false,
      theme: _theme,
      routerConfig: router,
    );
  }
}

final ThemeData _theme = ThemeData(
  scaffoldBackgroundColor: Palette.background,
  textTheme: GoogleFonts.poppinsTextTheme().copyWith(
    titleLarge: const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Palette.fullWhite,
    ),
    titleMedium: const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Palette.fullWhite,
    ),
    titleSmall: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Palette.fullWhite,
    ),
    displayLarge: const TextStyle(
      fontSize: 18,
      color: Palette.fullWhite,
    ),
    displayMedium: const TextStyle(
      fontSize: 14,
      color: Palette.fullWhite,
    ),
    displaySmall: const TextStyle(
      fontSize: 10,
      color: Palette.textGrey,
    ),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: Palette.iconWhite,
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Palette.background,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Palette.bottomBar,
    selectedItemColor: Palette.fullWhite,
    unselectedItemColor: Palette.iconGrey,
    selectedLabelStyle: TextStyle(
      fontSize: 10,
      color: Palette.textGrey,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 10,
      color: Palette.fullWhite,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Palette.fullWhite,
    size: 26,
  ),
);
