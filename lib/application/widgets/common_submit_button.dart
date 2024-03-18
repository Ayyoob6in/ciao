import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.buttonName,
    required this.buttonPress,
  });
  final String buttonName;
  final Function() buttonPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonPress,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black),
        child: Center(
            child: Text(
          buttonName,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
