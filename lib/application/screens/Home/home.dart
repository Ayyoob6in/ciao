import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmedia_app/application/screens/chat/screen_chat.dart';
import 'package:socialmedia_app/application/screens/home/widgets/home_card.dart';
import 'package:socialmedia_app/application/screens/Login/widget/gradient.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackGround(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Ciao",
                    style: GoogleFonts.birthstone(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const ScreenChat()));
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: Image.asset(
                        "assets/chatIcon.png",
                        color: Color.fromARGB(255, 249, 249, 250),
                      ),
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.08,
              //   child: ListView.builder(
              //     itemCount: 15,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       final bool isFirstStory = index == 0;
              //       return Padding(
              //         padding: const EdgeInsets.only(
              //           left: 2,
              //           right: 2,
              //         ),
              //         child: StoryPart1(
              //           userProfile: "assets/ThirdBoard.jpg",
              //           ontap: () {},
              //           showIcon: isFirstStory,
              //         ),
              //       );
              //     },
              //   ),
              // ),
              Expanded(
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: HomeCard(
                              cardPost:
                                  "https://images.pexels.com/photos/20339251/pexels-photo-20339251/free-photo-of-woman-wearing-dress-sitting-by-the-lake.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                              cardProfile: "assets/facebook.png",
                              cardLikePressed: () {},
                              cardCommentPressed: () {},
                              sharePressed: () {},
                              cardProfileName: "Edein Vindain",
                              cardDescription:
                                  "In this hexadecimal representation ation, 0xFFFFC0CB represents the color with full , 0xFFFFC0CB represents the color with full opacity (FF) and the RGB values for the color",
                              cardPostTime: "2.30",
                              cardcomments: "10",
                              cardlikes: "20",
                              cardMorePressed: () {}),
                        );
                      })))
            ],
          ),
        ),
      ),
    );
  }
}
