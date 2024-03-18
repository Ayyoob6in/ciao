import 'package:flutter/material.dart';

class ThirdBoard extends StatelessWidget {
  const ThirdBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        'assets/ThirdBoard.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
