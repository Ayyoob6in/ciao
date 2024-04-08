import 'package:flutter/material.dart';
import 'package:socialmedia_app/application/screens/login/widget/gradient.dart';
import 'package:socialmedia_app/application/screens/settings/widgets/showi_dilog.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: GradientBackGround(
        child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                ListTile(
                  onTap: () {
                    // logout(context);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return LogoutDialog();
                        });
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
}
