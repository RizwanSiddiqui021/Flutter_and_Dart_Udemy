import 'package:flutter/material.dart';
import 'package:multi_provider/providers/auth_provider.dart';
import 'package:multi_provider/providers/notes_provider.dart';
import 'package:multi_provider/providers/theme_provider.dart';
import 'package:multi_provider/screens/login_screen.dart';
import 'package:multi_provider/screens/note_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => NotesProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return MaterialApp(
      theme: ThemeData(
        brightness: themeProvider.isDark ? Brightness.dark : Brightness.light,
      ),
      home: authProvider.isLoggedIn ? NoteScreen() : LoginScreen(),
    );
  }
}
