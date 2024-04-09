import 'package:flutter/material.dart';

class UserProfileFirstSection extends StatelessWidget {
  const UserProfileFirstSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 290,
          color: Colors.white,
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
          height: 250,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: const BorderRadiusDirectional.only(
                bottomStart: Radius.circular(20),
                bottomEnd: Radius.circular(20)),
            child: Image.network(
              "https://images.pexels.com/photos/7088756/pexels-photo-7088756.jpeg?auto=compress&cs=tinysrgb&w=1200&lazy=load",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            left: 25,
            top: 50,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            )),
        Positioned(
          left: 100,
          top: 160,
          right: 100,
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(234, 204, 212, 241),
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white,
                      blurStyle: BlurStyle.outer,
                      blurRadius: 20)
                ],
                border: Border.all(color: Colors.white, width: 2)),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                maxRadius: 60,
                backgroundColor: Colors.black,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  // child: Image.network(
                  //   "https://i.pinimg.com/736x/03/ec/99/03ec99b435694521944327cf3e17c1c6.jpg",
                  //   fit: BoxFit.cover,
                  // ),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
