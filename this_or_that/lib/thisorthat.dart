import 'package:flutter/material.dart';

class Thisorthat extends StatefulWidget {
  const Thisorthat({super.key});

  @override
  State<Thisorthat> createState() => _ThisorthatState();
}

class _ThisorthatState extends State<Thisorthat> {
  final List<List<String>> choices = [
    ["Coffee ☕", "Tea 🍵"],
    ["Cats 🐱", "Dogs 🐶"],
    ["Marvel 💥", "DC 🦇"],
    ["Beach 🏖️", "Mountains 🗻"],
  ];

  int index = 0;

  void pickOption(int option) {
    setState(() {
      index = (index + 1) % choices.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("This or That")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => pickOption(0),
              child: Text(choices[index][0], style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => pickOption(1),
              child: Text(choices[index][1], style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}
