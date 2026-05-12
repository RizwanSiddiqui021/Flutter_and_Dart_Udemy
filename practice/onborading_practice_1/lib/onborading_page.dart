import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onPressed;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image),
        Text(title, style: const TextStyle(fontSize: 28)),
        Text(subtitle, textAlign: TextAlign.center),
        ElevatedButton(onPressed: onPressed, child: const Text("Next")),
      ],
    );
  }
}
