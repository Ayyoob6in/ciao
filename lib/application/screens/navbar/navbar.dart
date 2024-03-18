import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia_app/application/screens/navbar/widgets/navbar_icon.dart';
import 'package:socialmedia_app/application/screens/Home/home.dart';
import 'package:socialmedia_app/application/screens/Login/widget/gradient.dart';
import 'package:socialmedia_app/application/screens/search/search.dart';

class ScreenNavigation extends StatelessWidget {
  ScreenNavigation(
      {super.key, required this.accesToken, required this.refreshToken});
  final _pageController = PageController();
  final String accesToken;
  final String refreshToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradientBackGround(
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              const ScreenHome(),
              ScreenSearch(),
              const Icon(Icons.history, color: Colors.blue),
              const Icon(Icons.history, color: Colors.blue),
              const Icon(Icons.history, color: Colors.blue),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.white10,
            buttonBackgroundColor: Colors.deepPurple,
            color: const Color.fromARGB(249, 104, 58, 183),
            animationCurve: Curves.ease,
            height: 75,
            items: const <Widget>[
              NavbarIcon(
                iconData: Icons.home,
              ),
              NavbarIcon(
                iconData: Icons.search,
              ),
              NavbarIcon(
                iconData: Icons.add,
              ),
              NavbarIcon(
                iconData: Icons.notifications,
              ),
              NavbarIcon(
                iconData: Icons.person,
              ),
            ],
            onTap: (index) {
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut);
            }));
  }
}
