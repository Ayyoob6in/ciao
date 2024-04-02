import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfileText extends StatelessWidget {
  const UserProfileText({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.aBeeZee(textStyle: TextStyle(letterSpacing: 2)),
    );
  }
}
