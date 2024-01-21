import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:piton_tech_project/core/services/storage_service.dart';
import 'package:piton_tech_project/router.dart';
import 'package:piton_tech_project/themes/palette.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize storage service
  StorageService();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Piton Tech Project',
      debugShowCheckedModeBanner: false,
      theme: _theme,
      routerConfig: AppRouter().router,
    );
  }
}

final ThemeData _theme = ThemeData(
  scaffoldBackgroundColor: Palette.background,
);
