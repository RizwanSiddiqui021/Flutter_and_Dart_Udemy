import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class CompletedScreen extends StatelessWidget {
  CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(
      context,
    ).tasks.where((task) => task["completed"]).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Completed")),
      body: tasks.isEmpty
          ? Center(child: Text("No completed tasks yet"))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(tasks[index]["title"]));
              },
            ),
    );
  }
}
