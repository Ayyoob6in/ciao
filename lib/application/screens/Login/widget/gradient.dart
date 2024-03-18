import 'package:flutter/material.dart';

class GradientBackGround extends StatelessWidget {
  const GradientBackGround({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.deepPurpleAccent,
            Color.fromARGB(185, 228, 85, 250),
            Colors.white
          ], // Your three colors
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.2,
            0.8,
            1.0
          ], // Position where the colors should start and end
        ),
      ),
      child: child,
    );
  }
}
