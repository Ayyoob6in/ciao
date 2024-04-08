import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialmedia_app/application/screens/login/screen_login.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[400],
      title: const Text('Logout'),
      content: const Text('Are you sure you want to logout?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss the dialog and return false
          },
          child: const Text('Cancel', style: TextStyle(color: Colors.white)),
        ),
        TextButton(
          onPressed: () {
            logout(context);
          },
          child:
              const Text('Logout', style: TextStyle(color: Colors.redAccent)),
        ),
      ],
    );
  }

  logout(BuildContext context) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.clear();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => ScreenLogin()),
        (route) => false);
  }
}
