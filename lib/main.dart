import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theming_with_provider/application/theme_service.dart';
import 'package:theming_with_provider/presentation/screens/theme_animation/theme_animation_screen.dart';
import 'package:theming_with_provider/presentation/theme/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => ThemeService()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const HomePage(),
        routes: const <String, WidgetBuilder>{
          // '/root': (BuildContext context) => const RootBottomNavigation(),
          // '/screenOne': (BuildContext context) => const ScreenOne(),
          // '/screenTwo': (BuildContext context) => const ScreenTwo(),
        },
      );
    });
  }
}
