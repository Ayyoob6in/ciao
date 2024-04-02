import 'package:flutter/material.dart';
import 'package:socialmedia_app/core/constants/constant_color.dart';
import 'package:socialmedia_app/core/constants/constant_radius.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';
import 'package:socialmedia_app/data/model/chat/chat_model.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: containerRadius)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
        child: ListView.builder(
            itemCount: dummyData.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(dummyData[index].avtarUrl),
                      radius: 26,
                      child: dummyData[index].online
                          ? Container(
                              margin:
                                  const EdgeInsets.only(bottom: 40, right: 40),
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                  color: Colors.lightBlueAccent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                            )
                          : Container(),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dummyData[index].name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          dummyData[index].time,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            if (dummyData[index].seen)
                              Icon(
                                Icons.done_all,
                                color: Colors.blue[600],
                                size: 18,
                              ),
                            sHeight5,
                            Expanded(
                                child: Text(
                              dummyData[index].message,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                            )),
                            if (!dummyData[index].seen)
                              Container(
                                height: 15,
                                width: 15,
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                                child: const Align(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        color: kWhite,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ),
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                    thickness: 0.4,
                    indent: 70,
                    endIndent: 20,
                  )
                ],
              );
            }),
      ),
    ));
  }
}
