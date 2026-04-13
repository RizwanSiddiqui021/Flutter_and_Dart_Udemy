import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/providers/auth_provider.dart';
import 'package:task_tracker/providers/task_provider.dart';

class AppDrawer extends StatelessWidget {

  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final tasks = Provider.of<TaskProvider>(context);

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(auth.username),
            accountEmail: Text("Local User"),
          ),
          ListTile(title: Text("Completed Tasks: ${tasks.completedCount}")),
          ListTile(title: Text("Pending Tasks: ${tasks.pendingCount}")),
          Spacer(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              auth.logout();
            },
          ),
        ],
      ),
    );
  }
}
