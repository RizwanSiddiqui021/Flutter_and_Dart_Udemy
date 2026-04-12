import 'package:flutter/material.dart';
import 'package:multi_provider/providers/auth_provider.dart';
import 'package:multi_provider/providers/notes_provider.dart';
import 'package:multi_provider/providers/theme_provider.dart';
import 'package:multi_provider/widgets/add_note_sheet.dart';
import 'package:provider/provider.dart';

class NoteScreen extends StatelessWidget {
  NoteScreen({super.key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notesProvider = Provider.of<NotesProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Notes by ${authProvider.username}"),
        actions: [
          IconButton(
            onPressed: () {
              themeProvider.toggleTheme();
            },
            icon: Icon(Icons.dark_mode),
          ),

          IconButton(
            onPressed: () {
              authProvider.logout();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: notesProvider.notes.length,
        itemBuilder: (context, index) {
          final note = notesProvider.notes[index];
          return ListTile(
            title: Text(note.title),
            subtitle: Text(note.content),
            trailing: IconButton(
              onPressed: () {
                notesProvider.deleteNote(note.id);
              },
              icon: Icon(Icons.delete),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (_) => AddNoteSheet(),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
