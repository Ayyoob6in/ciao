import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({super.key, required this.message, required this.isMe});
  final String message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ))
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.lightBlue.shade50,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ))
          ],
        ),
      );
    }
  }
}
