import 'package:flutter/material.dart';

class SecondBoard extends StatelessWidget {
  const SecondBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Image.asset(
        'assets/SecondBoard.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
