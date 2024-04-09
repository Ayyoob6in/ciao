import 'package:flutter/material.dart';
import 'package:socialmedia_app/application/screens/Login/widget/gradient.dart';
import 'package:socialmedia_app/application/screens/newpassword/screen_newpassword.dart';
import 'package:socialmedia_app/application/screens/otp/otp_continer.dart';
import 'package:socialmedia_app/application/widgets/common_backbutton.dart';
import 'package:socialmedia_app/application/widgets/common_submit_button.dart';
import 'package:socialmedia_app/application/widgets/common_subtitle.dart';
import 'package:socialmedia_app/application/widgets/common_title_text.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';

// ignore: must_be_immutable
class ScreenOtp extends StatelessWidget {
  ScreenOtp({super.key, required this.token});
  final String token;
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackGround(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
              sHeight20,
              const CommonTitleText(text: "Forgot Password?"),
              sHeight20,
              const CommonSubtitleText(
                subtitle:
                    "Don't worry! it occurs.please enter the email\naddress linked with your email",
              ),
              sHeight30,
              sHeight20,
              sHeight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OtpContiner1(otpController4: otpController1),
                  OtpContiner1(otpController4: otpController2),
                  OtpContiner1(otpController4: otpController3),
                  OtpContiner1(otpController4: otpController4),
                ],
              ),
              sHeight20,
              SubmitButton(
                buttonName: "Verify",
                buttonPress: () {
                  final otp = otpController1.text +
                      otpController2.text +
                      otpController3.text +
                      otpController4.text;
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => ScreenNewPassword(
                            otp: otp,
                            token: token,
                          ))));
                },
              ),
              sHeight50,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't received code?"),
                  sWidth10,
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Resend",
                      style: TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
