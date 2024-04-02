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
            // Color.fromARGB(144, 58, 36, 226),
            // Color.fromARGB(214, 82, 89, 205),
            Colors.blueAccent,
            Colors.white,
            Colors.blueAccent,
            Colors.white

            // Color.fromARGB(180, 53, 107, 253),
            // Colors.white,
            // Color.fromARGB(255, 248, 249, 251)
          ], // Your three colors
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.1,
            0.5,
            0.9,
            1.0
          ], // Position where the colors should start and end
        ),
      ),
      child: child,
    );
  }
}
