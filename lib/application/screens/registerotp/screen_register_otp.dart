import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:socialmedia_app/application/screens/Login/screen_login.dart';
import 'package:socialmedia_app/application/screens/Login/widget/gradient.dart';
import 'package:socialmedia_app/application/screens/navbar/navbar.dart';
import 'package:socialmedia_app/application/screens/otp/otp_continer.dart';
import 'package:socialmedia_app/application/widgets/common_backbutton.dart';
import 'package:socialmedia_app/application/widgets/common_submit_button.dart';
import 'package:socialmedia_app/application/widgets/common_subtitle.dart';
import 'package:socialmedia_app/application/widgets/common_title_text.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';
import 'package:socialmedia_app/data/apiservice/signup_otp_verify.dart';
import 'package:socialmedia_app/data/model/profile/signup_verify_model.dart';

// ignore: must_be_immutable
class ScreenRegisterOtp extends StatelessWidget {
  ScreenRegisterOtp({super.key, required this.otpToken});
  final String otpToken;

  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
              const CommonTitleText(text: "Email verification!"),
              sHeight20,
              const CommonSubtitleText(
                subtitle: "please enter the OTP\nsended to your email",
              ),
              sHeight30,
              sHeight20,
              sHeight20,
              Form(
                key: formKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OtpContiner1(otpController4: otpController1),
                    OtpContiner1(otpController4: otpController2),
                    OtpContiner1(otpController4: otpController3),
                    OtpContiner1(otpController4: otpController4),
                  ],
                ),
              ),
              sHeight20,
              SubmitButton(
                buttonName: "Verify",
                buttonPress: () {
                  if (formKey.currentState!.validate()) {
                    verifyOtp(context);
                  }
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

  void verifyOtp(BuildContext context) async {
    // Get the entered OTP from text fields
    String otp = otpController1.text +
        otpController2.text +
        otpController3.text +
        otpController4.text;

    try {
      // Call OTP verification service
      OtpVerificationResponse? response =
          await SignUpOtpVerifyService.verifyOtp(otpToken, otp);

      // ignore: unnecessary_null_comparison
      if (response != null && response.afterExecution != null) {
        String accessToken =
            response.afterExecution['accesstoken'] ?? ''; // Null check
        String refreshToken =
            response.afterExecution['refreshtoken'] ?? ''; // Null check

        if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
          // Store the access token and refresh token
          await SignUpOtpVerifyService.storeTokens(accessToken, refreshToken);
          print(response);

          // Navigate to the home screen
          Navigator.pushReplacement(
            // ignore: use_build_context_synchronously
            context,
            MaterialPageRoute(
              builder: (context) => ScreenNavigation(
                accesToken: accessToken,
                refreshToken: refreshToken,
              ),
            ),
          );

          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text("User Registered SuccessFully!"),
            ),
          );
          return; // Exit the function after successful navigation
        }
      }
      // Navigate to the login screen if access token or refresh token is missing
      Navigator.pushReplacement(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(
          builder: (context) => ScreenLogin(),
        ),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Something Went Wrong!"),
        ),
      );
    } catch (e) {
      print("Error verifying OTP: $e");
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Enter valid Otp!"),
        ),
      );
      // Handle error, show error message, etc.
    }
  }
}
