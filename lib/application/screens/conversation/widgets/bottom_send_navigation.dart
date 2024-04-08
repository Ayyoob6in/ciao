import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:socialmedia_app/core/constants/constant_color.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';

// ignore: must_be_immutable
class BottomSendNavigation extends StatefulWidget {
  const BottomSendNavigation({super.key});

  @override
  State<BottomSendNavigation> createState() => _BottomSendNavigationState();
}

class _BottomSendNavigationState extends State<BottomSendNavigation>
    with SingleTickerProviderStateMixin {
  final TextEditingController _sendMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhite,
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: TextField(
                        controller: _sendMessageController,
                        cursorColor: kBlack,
                        decoration: InputDecoration(
                            hintText: "Type Here",
                            border: InputBorder.none,
                            icon: const Icon(
                              // ignore: deprecated_member_use
                              FontAwesomeIcons.smileWink,
                              color: Colors.grey,
                              size: 20,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  FontAwesomeIcons.paperclip,
                                  size: 20,
                                  color: Colors.grey,
                                ))),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(right: 12),
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: const Icon(
                      FontAwesomeIcons.microphone,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                  sWidth10,
                  Container(
                    padding: const EdgeInsets.only(
                      right: 5,
                    ),
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: appColor),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          FontAwesomeIcons.paperPlane,
                          color: kWhite,
                          size: 20,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
