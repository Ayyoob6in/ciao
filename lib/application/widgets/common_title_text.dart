import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTitleText extends StatelessWidget {
  const CommonTitleText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        textStyle: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          //fontStyle: FontStyle.italic,
          color: Colors.black87,
        ),
      ),
    );
  }
}
