import 'package:flutter/material.dart';
import 'package:socialmedia_app/application/screens/Login/screen_login.dart';
import 'package:socialmedia_app/application/screens/Login/widget/gradient.dart';
import 'package:socialmedia_app/application/screens/Login/widget/login_screen_textfield.dart';
import 'package:socialmedia_app/application/screens/otp/otp.dart';
import 'package:socialmedia_app/application/widgets/common_submit_button.dart';
import 'package:socialmedia_app/application/widgets/common_subtitle.dart';
import 'package:socialmedia_app/application/widgets/common_title_text.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';
import 'package:socialmedia_app/data/apiservice/forgotpassword/forgotpassword_service.dart';

import '../../widgets/common_backbutton.dart';

class ScreenForgotPassword extends StatelessWidget {
  ScreenForgotPassword({super.key});
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackGround(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sHeight40,
                    sHeight30,
                    CommonBackButton(
                      buttonPress: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    sHeight10,
                    const CommonTitleText(text: "Forgot Password?"),
                    sHeight10,
                    const CommonSubtitleText(
                      subtitle:
                          "Don't worry! it occurs.please enter the email\naddress linked with your email",
                    ),
                    sHeight30,
                    CustomTextFielsWidget(
                      hint: "Please enter your email",
                      fieldIcon: Icons.email,
                      controller: emailController,
                    ),
                    sHeight20,
                    SubmitButton(
                      buttonName: "Send Code",
                      buttonPress: () async {
                        final token = await ForgotPasswordService()
                            .forgotPassword(emailController.text);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => ScreenOtp(
                                  token: token.toString(),
                                )));
                      },
                    ),
                    sHeight50,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Remember Password?"),
                        sWidth10,
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => ScreenLogin()));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ))),
    );
  }
}
