import 'package:flutter/material.dart';
import 'package:roll_dice/dice_roller.dart';

class GradientContaner extends StatelessWidget {
  const GradientContaner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purpleAccent, Colors.indigoAccent],
          begin: AlignmentGeometry.topLeft,
          end: AlignmentGeometry.bottomRight,
        ),
      ),
      child: Center(child: DiceRoller()),
    );
  }
}
