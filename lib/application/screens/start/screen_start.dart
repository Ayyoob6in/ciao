import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:socialmedia_app/application/screens/Login/screen_login.dart';
import 'package:socialmedia_app/application/screens/start/widgets/first_board.dart';
import 'package:socialmedia_app/application/screens/start/widgets/second_board.dart';
import 'package:socialmedia_app/application/screens/start/widgets/third_board.dart';

class ScreenStart extends StatefulWidget {
  const ScreenStart({super.key});

  @override
  State<ScreenStart> createState() => _ScreenStartState();
}

class _ScreenStartState extends State<ScreenStart> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [FirstBoard(), SecondBoard(), ThirdBoard()],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      _controller.jumpToPage(2);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Colors.white),
                    )),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                ),
                onLastPage
                    ? TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => ScreenLogin()));
                        },
                        child: const Text(
                          "Let's Start",
                          style: TextStyle(color: Colors.white),
                        ))
                    : TextButton(
                        onPressed: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.slowMiddle);
                        },
                        child: const Text(
                          "Next",
                          style: TextStyle(color: Colors.white),
                        )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
