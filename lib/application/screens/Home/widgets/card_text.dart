import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardText extends StatelessWidget {
  const CardText({
    super.key,
    required this.cardText,
  });
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Text(cardText,
        style: GoogleFonts.aBeeZee(
          textStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ));
  }
}
