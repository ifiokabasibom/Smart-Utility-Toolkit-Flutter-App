import 'package:flutter/material.dart';
import 'features/home/home_screen.dart';
import 'core/theme/app_theme.dart';
import 'features/notes/notes_screen.dart';
import 'features/calculator/calculator_screen.dart';
import 'features/converter/converter_screen.dart';

void main() {
  runApp(const SmartUtilityToolkitApp());
}

class SmartUtilityToolkitApp extends StatelessWidget {
  const SmartUtilityToolkitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Utility Toolkit',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),

      routes: {
        '/converter': (context) => const ConverterScreen(),
        '/calculator': (context) => const CalculatorScreen(),
        '/notes': (context) => const NotesScreen(),
      },
    );
  }
}