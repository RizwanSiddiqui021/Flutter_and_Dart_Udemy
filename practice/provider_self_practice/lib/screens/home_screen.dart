import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_self_practice/providers/todo_provider.dart';
import 'package:provider_self_practice/widgets/todo_tile.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController todoTitleController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<TodoProvider>();

    return Scaffold(
      appBar: AppBar(title: Text("Todo App")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: todoTitleController,
                    decoration: InputDecoration(
                      hintText: "Enter a task...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    if (todoTitleController.text.isNotEmpty) {
                      provider.addTodo(todoTitleController.text);
                    }
                  },
                  child: Text("Add Todo"),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: provider.todos.length,
              itemBuilder: TodoTile(
                todo: provider.todos[index],
                onToggle: () => provider.toggleTodo(index),
                onDelete: () => provider.deleteTodo(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
