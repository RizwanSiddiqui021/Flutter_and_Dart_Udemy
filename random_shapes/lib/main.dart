import 'package:flutter/material.dart';
import 'package:random_shapes/scaffold_properties/scaffold_all_props.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ScaffoldAllProps());
  }
}
