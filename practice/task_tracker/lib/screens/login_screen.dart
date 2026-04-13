import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tracker/providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(labelText: "Enter your name"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    Provider.of<AuthProvider>(
                      context,
                      listen: false,
                    ).login(controller.text);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
