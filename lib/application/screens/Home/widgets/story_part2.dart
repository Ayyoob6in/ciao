import 'package:flutter/material.dart';

class StoryPart2 extends StatelessWidget {
  const StoryPart2({
    super.key,
    required this.profileImage,
  });
  final String profileImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 65.0,
        width: 65.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.deepPurple, width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              profileImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
