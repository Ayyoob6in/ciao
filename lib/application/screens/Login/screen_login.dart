import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialmedia_app/application/screens/login/widget/gradient.dart';
import 'package:socialmedia_app/application/screens/forgotpassword/forgot.dart';
import 'package:socialmedia_app/application/screens/navbar/navbar.dart';
import 'package:socialmedia_app/application/utils/email_validator.dart';
import 'package:socialmedia_app/application/widgets/common_divider.dart';
import 'package:socialmedia_app/application/widgets/common_submit_button.dart';
import 'package:socialmedia_app/data/apiservice/login_service.dart';
import 'package:socialmedia_app/data/model/login/login_model.dart';

import '../../../core/constants/contstant.dart';
import '../../widgets/common_title_text.dart';
import '../signup/signup.dart';
import 'widget/icon_continer.dart';
import 'widget/login_screen_textfield.dart';

// ignore: must_be_immutable
class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key, this.accesTokn});
  String? accesTokn;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackGround(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sHeight50,
                  sHeight30,
                  const CommonTitleText(
                    text: "Welcome Back ! Glad\nto see you, Again !",
                  ),
                  sHeight50,
                  sHeight50,
                  sHeight50,
                  CustomTextFielsWidget(
                    hint: "Enter Your Email",
                    fieldIcon: Icons.person,
                    controller: emailcontroller,
                    validator: (value) {
                      final regex = RegExp(Validators.emailValidator);
                      return value!.isEmpty || !regex.hasMatch(value)
                          ? 'Enter a valid email address'
                          : null;
                    },
                  ),
                  sHeight20,
                  CustomTextFielsWidget(
                    hint: "Enter Your Password",
                    sIcon: Icons.remove_red_eye,
                    fieldIcon: Icons.lock,
                    controller: passWordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      } else {
                        if (!Validators.passwordValidator.hasMatch(value)) {
                          return 'Enter valid password';
                        } else {
                          return null;
                        }
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => ScreenForgotPassword()));
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                    ],
                  ),
                  sHeight20,
                  SubmitButton(
                      buttonName: "LOGIN",
                      buttonPress: () {
                        if (formKey.currentState!.validate()) {
                          const Center(
                            child: CircularProgressIndicator(),
                          );
                          verifyLogin(context);
                        }
                      }),
                  sHeight30,
                  const CommonDivider(
                    centerTitile: "or Login With",
                  ),
                  sHeight20,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconContiner(iconUrl: "assets/facebook.png"),
                      IconContiner(iconUrl: "assets/Google.png"),
                      IconContiner(iconUrl: "assets/apple.png")
                    ],
                  ),
                  sHeight30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      sWidth10,
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => ScreenSignUp()));
                        },
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void verifyLogin(BuildContext context) async {
    String email = emailcontroller.text;
    String password = passWordController.text;

    try {
      // Call the login service
      LoginResponse response = await LoginService.login(email, password);

      // Check if login was successful
      if (response.statusCode == 200 || response.statusCode == 202) {
        final sharedPrefs = await SharedPreferences.getInstance();
        await sharedPrefs.setBool(saveKeyPrefs, true);
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => ScreenNavigation(
              accesToken: response.afterExecution.accessToken,
              refreshToken: response.afterExecution.refreshToken,
            ),
          ),
        );

        // Show success message
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Login Successful!"),
          ),
        );
      } else {
        // Show error message if login fails
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Invalid username or password! Please try again."),
          ),
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print("Error during login: $e");
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Invalid username or password! Please try again")));
      // Handle error, show error message, etc.
    }
  }
}
