import 'package:flutter/material.dart';
import 'package:flutter_provider_todo/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _items = [];

  List<Todo> get items => _items;

  void addTodo(String title) {
    _items.add(Todo(title: title));
    notifyListeners();
  }

  void toggleTodo(int index) {
    _items[index].isDone = !_items[index].isDone;
    notifyListeners();
  }

  void removeTodo(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
