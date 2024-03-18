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
              colors: [Colors.deepPurple, Colors.purple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds);
          },
          child: Icon(
            buttonICon,
            size: 35,
          ),
        ));
  }
}
