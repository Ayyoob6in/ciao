import 'package:flutter/material.dart';

class NavbarIcon extends StatelessWidget {
  const NavbarIcon({super.key, required this.iconData});
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      size: 35,
      color: Colors.white,
      shadows: const [
        Shadow(color: Colors.blueAccent, blurRadius: 20, offset: Offset(2, 3.7))
      ],
    );
  }
}
