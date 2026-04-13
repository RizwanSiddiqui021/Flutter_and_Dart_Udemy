import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';
import '../screens/assignments_screen.dart';
import '../screens/results_screen.dart';
import '../screens/settings_screen.dart';

class AppDrawer extends StatelessWidget {
  final int selectedIndex;

  const AppDrawer({super.key, required this.selectedIndex});

  void navigateTo(BuildContext context, int index) {
    Navigator.pop(context); // close drawer

    if (index == selectedIndex) return; // already there

    Widget screen;

    switch (index) {
      case 0:
        screen = const DashboardScreen();
        break;
      case 1:
        screen = const AssignmentsScreen();
        break;
      case 2:
        screen = const ResultsScreen();
        break;
      case 3:
        screen = const SettingsScreen();
        break;
      default:
        screen = const DashboardScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // 🔹 HEADER
          UserAccountsDrawerHeader(
            accountName: const Text("Rizwan Siddiqui"),
            accountEmail: const Text("rizwan@email.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
            ),
          ),

          // 🔹 MENU ITEMS
          buildItem(context, Icons.dashboard, "Dashboard", 0),
          buildItem(context, Icons.assignment, "Assignments", 1),
          buildItem(context, Icons.bar_chart, "Results", 2),
          buildItem(context, Icons.settings, "Settings", 3),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pop(context);
              // add logout logic
            },
          ),
        ],
      ),
    );
  }

  // 🔥 Reusable Tile Builder
  Widget buildItem(
    BuildContext context,
    IconData icon,
    String title,
    int index,
  ) {
    final isSelected = selectedIndex == index;

    return ListTile(
      leading: Icon(icon, color: isSelected ? Colors.blue : Colors.black),
      title: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onTap: () => navigateTo(context, index),
    );
  }
}
