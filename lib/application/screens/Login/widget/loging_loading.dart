import 'package:flutter/material.dart';

class LogingLoading extends StatelessWidget {
  const LogingLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.network(
          "assets/3586EF24-7A2E-46EC-B69F-DF6F240B1686_4_5005_c.jpeg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
