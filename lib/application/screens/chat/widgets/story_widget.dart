import 'package:flutter/material.dart';
import 'package:socialmedia_app/core/constants/constant_color.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';
import 'package:socialmedia_app/data/model/chat/chat_model.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(73, 243, 244, 245),
                      radius: 26,
                      child: Icon(
                        Icons.add,
                        color: kWhite,
                        size: 25,
                      ),
                    ),
                    sHeight5,
                    Text(
                      "Add Status",
                      style:
                          TextStyle(color: kWhite, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
              Row(
                children: List.generate(dummyData.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      children: [
                        dummyData[index].seen
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(
                                  dummyData[index].avtarUrl,
                                ),
                                radius: 26,
                              )
                            : CircleAvatar(
                                radius: 26,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundImage:
                                      NetworkImage(dummyData[index].avtarUrl),
                                ),
                              ),
                        sHeight5,
                        Text(
                          dummyData[index].name,
                          style: const TextStyle(
                              color: kWhite, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
