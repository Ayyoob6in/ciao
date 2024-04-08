import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socialmedia_app/application/screens/Login/widget/gradient.dart';
import 'package:socialmedia_app/application/screens/Login/widget/icon_continer.dart';
import 'package:socialmedia_app/application/screens/Login/widget/login_screen_textfield.dart';
import 'package:socialmedia_app/application/screens/registerotp/screen_register_otp.dart';
import 'package:socialmedia_app/application/utils/email_validator.dart';
import 'package:socialmedia_app/application/widgets/common_divider.dart';
import 'package:socialmedia_app/application/widgets/common_submit_button.dart';
import 'package:socialmedia_app/application/widgets/common_title_text.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';
import 'package:socialmedia_app/data/apiservice/signup_service.dart';
import 'package:socialmedia_app/data/model/apiexception/api_exception.dart';
import 'package:socialmedia_app/data/model/register/register_model.dart';

// ignore: must_be_immutable
class ScreenSignUp extends StatelessWidget {
  ScreenSignUp({super.key});

  TextEditingController userNameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  sHeight40,
                  const CommonTitleText(
                    text: "Hello! Register To get\nStarted !",
                  ),
                  sHeight40,
                  CustomTextFielsWidget(
                    hint: "User Name",
                    fieldIcon: Icons.person,
                    controller: userNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter User Name";
                      }
                      if (value.contains(' ')) {
                        return "should not contain spaces";
                      }
                      return null;
                    },
                  ),
                  sHeight20,
                  CustomTextFielsWidget(
                    hint: "Name",
                    fieldIcon: Icons.person,
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter name";
                      }
                      if (value.contains(' ')) {
                        return "should not contain spaces";
                      }
                      return null;
                    },
                  ),
                  sHeight20,
                  CustomTextFielsWidget(
                    hint: "Email",
                    fieldIcon: Icons.email,
                    controller: emailController,
                    validator: (value) {
                      final regex = RegExp(Validators.emailValidator);

                      return value!.isEmpty || !regex.hasMatch(value)
                          ? 'Enter a valid email address'
                          : null;
                    },
                  ),
                  sHeight20,
                  CustomTextFielsWidget(
                    keyboard: TextInputType.number,
                    hint: "Password",
                    sIcon: Icons.remove_red_eye,
                    fieldIcon: Icons.lock,
                    controller: passwordController,
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
                  sHeight20,
                  CustomTextFielsWidget(
                    hint: "Confirm Password",
                    sIcon: Icons.remove_red_eye,
                    keyboard: TextInputType.number,
                    fieldIcon: Icons.lock,
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) return 'Re-enter password';
                      if (value != passwordController.text) {
                        return 'PassWord Not matching';
                      }
                      return null;
                    },
                  ),
                  sHeight30,
                  SubmitButton(
                    buttonName: "Register",
                    buttonPress: () async {
                      if (formKey.currentState!.validate()) {
                        RegisterModel registerData = RegisterModel(
                          userName: userNameController.text,
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          confirmPassword: confirmPasswordController.text,
                        );
                        try {
                          Map<String, dynamic> response =
                              await RegisterApiService.registerUser(
                                  registerData);
                          log("response$response");

                          // Access the token from the "after execution" field
                          String? token = response['after execution']['token'];
                          log("this is token$token");

                          if (token != null) {
                            // ignore: avoid_print
                            print("Navigating to OTP Screen");
                            // ignore: avoid_print
                            print("this is token$token");

                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.deepPurple,
                                content: Text("Verify Email!"),
                              ),
                            );
                            // ignore: use_build_context_synchronously
                            navigateToRegisterOtpScreen(context, token);
                            // Call the navigation method
                          } else {
                            log("Token not found in response");
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("User-name or email exist!"),
                              ),
                            );
                          }
                        } catch (e) {
                          if (e is ApiException) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "API error occurred during registration"),
                              ),
                            );
                          }
                          log("Error ${e.toString()}");
                        }
                      }
                    },
                  ),
                  sHeight30,
                  const CommonDivider(
                    centerTitile: "or Register With",
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
                      const Text("Already have an account?"),
                      sWidth10,
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Login Now",
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

  void navigateToRegisterOtpScreen(BuildContext context, String token) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScreenRegisterOtp(
          otpToken: token,
        ),
      ),
    );
  }
}
