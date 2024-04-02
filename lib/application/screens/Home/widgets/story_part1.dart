import 'package:flutter/material.dart';

class StoryPart1 extends StatelessWidget {
  const StoryPart1(
      {super.key,
      this.showIcon = false,
      required this.userProfile,
      required this.ontap});

  final bool showIcon;
  final String userProfile;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            height: 65.0,
            width: 65.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 0.7)),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  userProfile,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        showIcon
            ? Positioned(
                left: 5,
                right: 5,
                top: 27,
                child: IconButton(
                    onPressed: () {},
                    icon: Container(
                        decoration: const BoxDecoration(
                            color: Colors.deepPurple, shape: BoxShape.circle),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ))))
            : SizedBox()
      ],
    );
  }
}
