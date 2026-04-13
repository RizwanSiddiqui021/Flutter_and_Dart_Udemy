import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return Center(
      child: SwitchListTile(
        title: Text("Dark Mode"),
        value: theme.isDark,
        onChanged: (_) => theme.toggleTheme(),
      ),
    );
  }
}
