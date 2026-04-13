import 'package:flutter/material.dart';
import 'package:student_app_drawer/widgets/app_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DashboardScreen")),
      drawer: AppDrawer(selectedIndex: 0),
      body: Center(child: Text("DashboardScreen")),
    );
  }
}
