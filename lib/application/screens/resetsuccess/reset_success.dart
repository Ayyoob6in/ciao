import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmedia_app/application/screens/Login/widget/gradient.dart';
import 'package:socialmedia_app/application/screens/reseterror/reset_error.dart';
import 'package:socialmedia_app/application/widgets/common_submit_button.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';

class ScreenResetSuccess extends StatelessWidget {
  const ScreenResetSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackGround(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.14,
                    child: Image.asset(
                      "assets/Animation - 1710390719037.gif",
                      fit: BoxFit.cover,
                    )),
                sHeight20,
                Text(
                  "Password Changed !",
                  style: GoogleFonts.saira(
                    textStyle: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                sHeight10,
                Text(
                  "Your Password has been changed\n                 SuccessFully",
                  style: GoogleFonts.saira(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                  child: SubmitButton(
                      buttonName: "Back to Login",
                      buttonPress: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) => const ScreenResetErro()));
                      }),
                )
              ],
            )),
      )),
    );
  }
}
