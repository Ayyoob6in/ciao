import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:socialmedia_app/application/screens/conversation/widgets/bottom_send_navigation.dart';
import 'package:socialmedia_app/application/screens/conversation/widgets/message_box.dart';
import 'package:socialmedia_app/core/constants/constant_color.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';
import 'package:socialmedia_app/data/model/conversation/conversation_model.dart';

class ScreenConversation extends StatelessWidget {
  final String userName;
  final String userProfile;
  final bool online;
  final String time;
  const ScreenConversation(
      {super.key,
      required this.userName,
      required this.userProfile,
      required this.online,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhite,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: appColor,
              )),
        ),
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(userProfile), fit: BoxFit.cover)),
            ),
            sWidth10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: TextStyle(
                      color: Colors.black.withOpacity(
                        0.7,
                      ),
                      fontSize: 16),
                ),
                online
                    ? Row(
                        children: [
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                shape: BoxShape.circle,
                                border: Border.all(color: kWhite, width: 2)),
                          ),
                          sWidth5,
                          const Text(
                            "Active Now",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )
                        ],
                      )
                    : Text(
                        time,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      )
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.call,
                color: appColor,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.video,
                size: 19,
                color: appColor,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: appColor,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          color: kWhite,
          child: ListView(
              children: List.generate(messages.length, (index) {
            return MessageBox(
              message: messages[index]['message'],
              isMe: messages[index]['isMe'],
            );
          })),
        ),
      ),
      bottomSheet: BottomSendNavigation(),
    );
  }
}
