import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserprofileFollwersText extends StatelessWidget {
  const UserprofileFollwersText({
    super.key,
    required this.followersText,
  });
  final String followersText;

  @override
  Widget build(BuildContext context) {
    return Text(followersText,
        style: GoogleFonts.aBeeZee(
          textStyle: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black),
        ));
  }
}
