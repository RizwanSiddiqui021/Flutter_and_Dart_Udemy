import 'package:flutter/material.dart';
import 'package:student_app_drawer/widgets/app_drawer.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ResultsScreen")),
      drawer: AppDrawer(selectedIndex: 2),
      body: Center(child: Text("ResultsScreen")),
    );
  }
}
