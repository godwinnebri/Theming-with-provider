import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theming_with_provider/application/theme_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<ThemeService>(context).toggleTheme(),
      ),
    );
  }
}
