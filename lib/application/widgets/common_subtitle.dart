import 'package:flutter/material.dart';

class CommonSubtitleText extends StatelessWidget {
  const CommonSubtitleText({super.key, required this.subtitle});
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}
