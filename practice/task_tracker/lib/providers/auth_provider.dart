import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  String _username = "";

  bool get isLoggedIn => _isLoggedIn;
  String get username => _username;

  void login(String name) {
    _username = name;
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _username = "";
    _isLoggedIn = false;
    notifyListeners();
  }
}
