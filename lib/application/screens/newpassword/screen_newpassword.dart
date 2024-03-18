import 'package:flutter/material.dart';
import 'package:socialmedia_app/application/screens/Login/widget/gradient.dart';
import 'package:socialmedia_app/application/screens/Login/widget/login_screen_textfield.dart';
import 'package:socialmedia_app/application/screens/resetsuccess/reset_success.dart';
import 'package:socialmedia_app/application/widgets/common_submit_button.dart';
import 'package:socialmedia_app/application/widgets/common_subtitle.dart';
import 'package:socialmedia_app/application/widgets/common_title_text.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';

import '../../widgets/common_backbutton.dart';

class ScreenNewPassword extends StatelessWidget {
  ScreenNewPassword({super.key});
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                    const CommonTitleText(text: "Create new paswword"),
                    sHeight10,
                    const CommonSubtitleText(
                      subtitle:
                          "Your new password must be unique from these\npreviously used",
                    ),
                    sHeight30,
                    CustomTextFielsWidget(
                      hint: "New password",
                      fieldIcon: Icons.lock,
                      controller: _passwordController,
                    ),
                    sHeight20,
                    CustomTextFielsWidget(
                      hint: "New password",
                      fieldIcon: Icons.lock,
                      controller: _confirmPasswordController,
                    ),
                    sHeight20,
                    SubmitButton(
                      buttonName: "Reset Password",
                      buttonPress: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const ScreenResetSuccess()));
                      },
                    ),
                    sHeight50,
                  ],
                ),
              ))),
    );
  }
}
