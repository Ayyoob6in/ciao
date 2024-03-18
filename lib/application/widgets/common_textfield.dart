import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonTextField extends StatelessWidget {
  CommonTextField(
      {super.key,
      this.keyboard,
      this.validation,
      required this.label,
      this.loginController,
      this.customOnChange,
      this.radius,
      this.seIcon,
      required this.preIcon});

  final String label;
  final TextEditingController? loginController;
  final Icon preIcon;
  final Icon? seIcon;
  final String? Function(String?)? validation;
  final TextInputType? keyboard;
  final Function(String?)? customOnChange;
  double? radius;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboard,
      onChanged: customOnChange,
      validator: validation,
      controller: loginController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          prefixIcon: preIcon,
          suffix: seIcon,
          iconColor: Colors.deepPurple,
          labelText: label,
          fillColor: Colors.white,
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 20))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(radius ?? 20)),
              borderSide: const BorderSide(color: Colors.white))),
    );
  }
}
