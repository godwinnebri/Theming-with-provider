import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theming_with_provider/application/theme_service.dart';
import 'package:theming_with_provider/presentation/screens/theme_animation/widgets/moon.dart';
import 'package:theming_with_provider/presentation/screens/theme_animation/widgets/sun.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sky Animation'),
      ),
      body: Consumer<ThemeService>(
        builder: (context, themeService, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                    height: constraints.maxHeight > 730 ? 700 : 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      gradient: LinearGradient(
                        colors: themeService.isDarkModeOn
                            ? const [
                                Color(0xFF94A9FF),
                                Color(0xFF6B66CC),
                                Color(0xFF200F75),
                              ]
                            : const [
                                Color(0xDDFFFA66),
                                Color(0xDDFFA057),
                                Color(0xDD940B99)
                              ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 400),
                          top: themeService.isDarkModeOn ? 100 : 130,
                          right: themeService.isDarkModeOn ? 100 : -40,
                          child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 300),
                              opacity: themeService.isDarkModeOn ? 1 : 0,
                              child: const Moon()),
                        ),
                        AnimatedPadding(
                          duration: const Duration(milliseconds: 400),
                          padding: EdgeInsets.only(
                              top: themeService.isDarkModeOn ? 150 : 50),
                          child: const Center(
                            child: Sun(),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                            height: 300,
                            width: constraints.maxWidth,
                            decoration: BoxDecoration(
                              color: themeService.isDarkModeOn
                                  ? Colors.grey[800]
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(34),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(28),
                              child: Column(
                                children: [
                                  Text(
                                    themeService.isDarkModeOn
                                        ? 'Night 🌚'
                                        : 'Day 🌤',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    themeService.isDarkModeOn
                                        ? 'It is night time'
                                        : 'It is day time',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  const SizedBox(height: 30),
                                  Switch(
                                      value: themeService.isDarkModeOn,
                                      onChanged: (_) {
                                        themeService.toggleTheme();
                                      })
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ));
              },
            ),
          );
        },
      ),
    );
  }
}
