import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // 🔹 HEADER
            UserAccountsDrawerHeader(
              accountName: Text("Rizwan Siddiqui"),
              accountEmail: Text("rizwan@email.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
              ),
            ),

            // 🔹 MENU ITEMS
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {},
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {},
            ),
          ],
        ),
      ),

      body: Center(child: Text("Home Screen")),
    );
  }
}
