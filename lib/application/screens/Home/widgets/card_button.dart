import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.buttonICon,
    required this.buttonPress,
  });
  final IconData buttonICon;

  final Function() buttonPress;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: buttonPress,
        icon: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Color.fromARGB(175, 32, 76, 221), Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
            ).createShader(bounds);
          },
          child: Icon(
            buttonICon,
            size: 35,
          ),
        ));
  }
}
