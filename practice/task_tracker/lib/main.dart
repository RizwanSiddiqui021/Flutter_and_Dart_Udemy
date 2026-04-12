import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/providers/auth_provider.dart';
import 'package:task_tracker/providers/task_provider.dart';
import 'package:task_tracker/providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: theme.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: auth.isLoggedIn ? MainScreen() : LoginScreen(),
    );
  }
}
