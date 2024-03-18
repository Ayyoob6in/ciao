import 'package:flutter/material.dart';

class FirstBoard extends StatelessWidget {
  const FirstBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        'assets/board4.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
