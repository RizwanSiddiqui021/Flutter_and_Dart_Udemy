import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _tasks = [];

  List<Map<String, dynamic>> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add({"title": title, "completed": false});
    notifyListeners();
  }

  void updateTask(int index, String newTitle) {
    _tasks[index]["title"] = newTitle;
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index]["completed"] = !_tasks[index]["completed"];
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  int get completedCount => _tasks.where((t) => t["completed"]).length;

  int get pendingCount => _tasks.where((t) => !t["completed"]).length;
}
