import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rusty_music/data/songs.dart';
import 'package:rusty_music/providers/audio_provider.dart';
import 'package:rusty_music/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => AudioProvider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen(songs: songs));
  }
}
