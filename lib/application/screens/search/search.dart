import 'package:flutter/material.dart';
import 'package:socialmedia_app/application/screens/Login/widget/gradient.dart';
import 'package:socialmedia_app/application/screens/Login/widget/login_screen_textfield.dart';
import 'package:socialmedia_app/application/screens/search/widgets/search_idle.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';

// ignore: must_be_immutable
class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackGround(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              sHeight50,
              sHeight20,
              CustomTextFielsWidget(
                hint: "Search",
                fieldIcon: Icons.search,
                controller: searchController,
                radius: 30,
                onchange: (value) {},
                shadow: const [
                  BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Colors.black,
                      blurRadius: 5,
                      spreadRadius: 0.2)
                ],
              ),
              const SearchIdle()
            ],
          ),
        ),
      ),
    );
  }
}
