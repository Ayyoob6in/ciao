import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialmedia_app/application/screens/login/screen_login.dart';
import 'package:socialmedia_app/application/screens/login/widget/gradient.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(234, 106, 134, 242),
      ),
      body: GradientBackGround(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                ListTile(
                  onTap: () {
                    logout(context);
                  },
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.black87, fontSize: 20),
                  ),
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.black87,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                  ),
                )
              ]),
            )),
      ),
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
