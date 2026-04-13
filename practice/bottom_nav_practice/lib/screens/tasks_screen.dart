import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_provider.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Tasks")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: "Enter task"),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (controller.text.trim().isNotEmpty) {
                      provider.addTask(controller.text);
                      controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: provider.tasks.length,
              itemBuilder: (context, index) {
                final task = provider.tasks[index];
                return ListTile(
                  title: Text(task['title']),
                  trailing: Checkbox(
                    value: task['completed'],
                    onChanged: (_) => provider.toggleTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
