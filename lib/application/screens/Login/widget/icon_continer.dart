import 'package:flutter/material.dart';

class IconContiner extends StatelessWidget {
  const IconContiner({
    super.key,
    required this.iconUrl,
    this.buttonClick,
  });
  final String iconUrl;
  final Function()? buttonClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonClick,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 222, 130, 238),
                blurRadius: 4,
                spreadRadius: 1.5,
              )
            ]),
        child: Image.asset(
          iconUrl,
          width: 60,
          height: 60,
        ),
      ),
    );
  }
}
