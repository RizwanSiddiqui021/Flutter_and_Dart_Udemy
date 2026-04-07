import 'package:flutter/material.dart';

class Countermodel extends ChangeNotifier {
  int count = 0;
  void increase() {
    count++;
    notifyListeners();
  }
}
