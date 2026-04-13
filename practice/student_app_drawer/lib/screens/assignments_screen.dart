import 'package:flutter/material.dart';
import 'package:student_app_drawer/widgets/app_drawer.dart';

class AssignmentsScreen extends StatelessWidget {
  const AssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assignment")),
      drawer: AppDrawer(selectedIndex: 1),
      body: Center(child: Text("Assignment")),
    );
  }
}
