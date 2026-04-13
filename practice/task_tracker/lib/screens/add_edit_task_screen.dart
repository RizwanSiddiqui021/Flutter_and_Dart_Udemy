import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/providers/task_provider.dart';

class AddEditTaskScreen extends StatelessWidget {
  final int? index;
  final String? existingTitle;

  AddEditTaskScreen({super.key, this.index, this.existingTitle});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (existingTitle != null) {
      controller.text = existingTitle!;
    }

    return Scaffold(
      appBar: AppBar(title: Text(index == null ? "Add Task" : "Edit Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: controller),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Save"),
              onPressed: () {
                final provider = Provider.of<TaskProvider>(
                  context,
                  listen: false,
                );

                if (controller.text.isEmpty) return;

                if (index == null) {
                  provider.addTask(controller.text);
                } else {
                  provider.updateTask(index!, controller.text);
                }

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
