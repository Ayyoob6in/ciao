// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialmedia_app/application/screens/navbar/navbar.dart';
import 'package:socialmedia_app/application/screens/start/screen_start.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';
import 'package:socialmedia_app/data/apiservice/login_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn(context);
    super.initState();
  }

  // ignore: annotate_overrides
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: SizedBox(
          width: double.infinity,
          child: Image.asset(
            "assets/63CC70DE-A50D-43FB-AF26-85AE64780040.png",
            fit: BoxFit.cover,
          ),
        ),
        duration: 300,
        splashIconSize: 325,
        splashTransition: SplashTransition.sizeTransition,
        pageTransitionType: PageTransitionType.topToBottom,
        // centered: true,
        animationDuration: const Duration(seconds: 2),
        nextScreen: const ScreenStart());
  }

  checkUserLoggedIn(BuildContext context) async {
    final sharedprefs = await SharedPreferences.getInstance();
    // ignore: no_leading_underscores_for_local_identifiers
    final _userLoggedIn = sharedprefs.getBool(saveKeyPrefs);
    String? accessToken = await LoginService.getAccessToken();
    String? refreshToken = await LoginService.getRefreshToken();
    // ignore: unnecessary_null_comparison
    if (_userLoggedIn == false || _userLoggedIn == null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ScreenStart()));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ScreenNavigation(
                accesToken: accessToken.toString(),
                refreshToken: refreshToken.toString(),
              )));
    }
  }
}
