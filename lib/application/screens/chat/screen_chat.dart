import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialmedia_app/application/screens/chat/widgets/chat_widget.dart';
import 'package:socialmedia_app/application/screens/chat/widgets/story_widget.dart';
import 'package:socialmedia_app/core/constants/constant_color.dart';
import 'package:socialmedia_app/core/constants/constant_radius.dart';

class ScreenChat extends StatefulWidget {
  const ScreenChat({super.key});

  @override
  State<ScreenChat> createState() => _ScreenChatState();
}

class _ScreenChatState extends State<ScreenChat>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "Chats",
          style: TextStyle(color: kWhite),
        ),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: kWhite,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                color: kWhite,
              ))
        ],
      ),
      body: const Column(
        children: [StoryWidget(), ChatWidget()],
      ),
      floatingActionButton: ClipRRect(
        borderRadius: const BorderRadius.all(containerRadius),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 18,
          color: Colors.blueAccent,
          child: TabBar(
            controller: _tabController,
            indicatorColor: kWhite,
            tabs: const [
              Tab(
                child: Icon(
                  FontAwesomeIcons.solidCommentDots,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              Tab(
                child: Icon(
                  FontAwesomeIcons.video,
                  color: kWhite,
                  size: 20,
                ),
              ),
              Tab(
                child: Icon(
                  // ignore: deprecated_member_use
                  FontAwesomeIcons.phoneAlt,
                  color: kWhite,
                  size: 20,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
