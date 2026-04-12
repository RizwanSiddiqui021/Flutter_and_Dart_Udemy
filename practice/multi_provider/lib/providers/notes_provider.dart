import 'package:flutter/material.dart';
import 'package:multi_provider/models/note.dart';

class NotesProvider extends ChangeNotifier {
  List<Note> _notes = [];
  List<Note> get notes => _notes;

  void addNote(String title, String content) {
    _notes.add(
      Note(id: DateTime.now().toString(), title: title, content: content),
    );
    notifyListeners();
  }

  void deleteNote(String id) {
    _notes.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
