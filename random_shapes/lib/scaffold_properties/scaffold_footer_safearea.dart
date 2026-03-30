import 'package:flutter/material.dart';

class ScaffoldFooterSafearea extends StatelessWidget {
  const ScaffoldFooterSafearea({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Footer + SafeArea"),
        elevation: 1,
        centerTitle: true,
      ),

      body: SafeArea(child: Center(child: Text('Content inside SafeArea!!'))),

      persistentFooterButtons: [
        ElevatedButton(onPressed: () {}, child: Text("Save")),
        TextButton(onPressed: () {}, child: Text("Cancel")),
      ],

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
