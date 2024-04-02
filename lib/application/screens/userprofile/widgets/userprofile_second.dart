import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmedia_app/application/screens/userprofile/widgets/user_profile_followers_text.dart';
import 'package:socialmedia_app/application/screens/userprofile/widgets/user_profile_text.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';
import 'package:socialmedia_app/data/model/profile/profile.dart';

class UserProfileSecondSection extends StatelessWidget {
  const UserProfileSecondSection({
    super.key,
    required Future<UserData?> fetchUserProfileService,
  }) : _fetchUserProfileService = fetchUserProfileService;

  final Future<UserData?> _fetchUserProfileService;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserData?>(
        future: _fetchUserProfileService,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went Wrong"),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            final UserData userProfile = snapshot.data!;
            // Access data from "after execution" section
            final AfterExecution? afterExecution = userProfile.afterExecution;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  afterExecution!.name ?? '',
                  style: GoogleFonts.notoSansTakri(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 23)),
                ),
                Text(afterExecution.username ?? ''),
                sHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        UserprofileFollwersText(
                          followersText: "${afterExecution.postsCount ?? ''}",
                        ),
                        const UserProfileText(text: "Post")
                      ],
                    ),
                    sWidth20,
                    Column(
                      children: [
                        UserprofileFollwersText(
                          followersText:
                              '${afterExecution.followersCount ?? ''}',
                        ),
                        const UserProfileText(text: "Followers")
                      ],
                    ),
                    sWidth20,
                    Column(
                      children: [
                        UserprofileFollwersText(
                          followersText:
                              '${afterExecution.followingCount ?? ''}',
                        ),
                        const UserProfileText(
                          text: "Following",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          } else {
            return const Center(
              child: Text("Error"),
            );
          }
        });
  }
}
