import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostButtons extends StatelessWidget {
  const PostButtons({
    super.key,
    required this.buttonPress,
    required this.buttonNAme,
  });

  final Function() buttonPress;
  final String buttonNAme;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: buttonPress,
      child: Container(
        height: 40,
        width: 120,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.white, blurRadius: 0.5, spreadRadius: 0.5)
          ],
          color: Colors.blueAccent,
        ),
        child: Text(buttonNAme,
            style: GoogleFonts.ibmPlexSansArabic(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontSize: 18))),
      ),
    );
  }
}
