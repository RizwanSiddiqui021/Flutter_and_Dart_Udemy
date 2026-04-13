import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  List<Map<String, dynamic>> tasks = [];

  void addTask(String title) {
    tasks.add({"title": title, "completed": false});
    notifyListeners();
  }

  void toggleTask(int index) {
    tasks[index]['completed'] = !tasks[index]['completed'];
    notifyListeners();
  }
}
