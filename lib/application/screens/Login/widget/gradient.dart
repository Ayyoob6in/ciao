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
            Color.fromARGB(189, 33, 149, 243),
            Colors.blue,
            Color.fromARGB(255, 248, 249, 251)
          ], // Your three colors
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.4,
            0.8,
            1.0
          ], // Position where the colors should start and end
        ),
      ),
      child: child,
    );
  }
}
