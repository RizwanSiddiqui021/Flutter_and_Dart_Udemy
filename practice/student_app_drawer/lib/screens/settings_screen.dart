import 'package:flutter/material.dart';
import 'package:student_app_drawer/widgets/app_drawer.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SettingsScreen")),
      drawer: AppDrawer(selectedIndex: 3),
      body: Center(child: Text("SettingsScreen")),
    );
  }
}
