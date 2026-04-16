import 'package:flutter/material.dart';
import '../converter/converter_screen.dart';
import '../calculator/calculator_screen.dart';
import '../notes/notes_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Utility Toolkit'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ToolCard(
            title: "Unit Converter",
            icon: Icons.swap_horiz,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ConverterScreen(),
                ),
              );
            },
          ),
          ToolCard(
            title: "Calculator",
            icon: Icons.calculate,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CalculatorScreen(),
                ),
              );
            },
          ),
          ToolCard(
            title: "Notes",
            icon: Icons.note,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NotesScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ToolCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ToolCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}