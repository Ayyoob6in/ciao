import 'package:flutter/material.dart';
import 'package:socialmedia_app/application/screens/Home/widgets/card_button.dart';
import 'package:socialmedia_app/application/screens/Home/widgets/card_text.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.cardPost,
    required this.cardProfile,
    required this.cardLikePressed,
    required this.cardCommentPressed,
    required this.sharePressed,
    required this.cardProfileName,
    required this.cardDescription,
    required this.cardPostTime,
    required this.cardcomments,
    required this.cardlikes,
    required this.cardMorePressed,
  });

  final String cardPost;
  final String cardProfile;
  final String cardProfileName;
  final String cardDescription;
  final String cardPostTime;
  final String cardcomments;
  final String cardlikes;

  final Function() cardLikePressed;
  final Function() cardCommentPressed;
  final Function() sharePressed;
  final Function() cardMorePressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 1,
          minHeight: MediaQuery.of(context).size.height * 0.5),
      child: Container(
        height: 535,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
            color: Color.fromARGB(234, 153, 61, 252)),
        child: Column(
          children: [
            sHeight10,
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.black,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    cardProfile,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                cardProfileName,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600),
              ),
              subtitle: Row(
                children: [
                  Text(
                    "$cardPostTime・",
                    style: const TextStyle(color: Colors.white60),
                  ),
                  const Icon(
                    Icons.person_2_outlined,
                    color: Colors.white60,
                  )
                ],
              ),
              trailing: IconButton(
                  onPressed: cardMorePressed,
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
            sHeight10,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Text(
                cardDescription,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            sHeight20,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    cardPost,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sHeight20,
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  CardButton(
                    buttonICon: Icons.favorite,
                    buttonPress: cardLikePressed,
                  ),
                  CardText(
                    cardText: cardlikes,
                  ),
                  CardButton(
                    buttonICon: Icons.comment,
                    buttonPress: cardCommentPressed,
                  ),
                  CardText(
                    cardText: cardcomments,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  CardButton(
                    buttonICon: Icons.telegram,
                    buttonPress: sharePressed,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
