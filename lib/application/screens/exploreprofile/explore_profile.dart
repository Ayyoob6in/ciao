import 'package:flutter/material.dart';
import 'package:socialmedia_app/application/screens/exploreprofile/ecplorefirst.dart';
import 'package:socialmedia_app/application/screens/exploreprofile/randomProfile_first.dart';
import 'package:socialmedia_app/data/apiservice/randomProfile/random_profile_service.dart';
import 'package:socialmedia_app/data/model/explore_profile/explore_profile.dart';

class RandomProfile extends StatefulWidget {
  const RandomProfile({
    super.key,
    required this.id,
  });
  final String id;
  @override
  State<RandomProfile> createState() => _RandomProfileState();
}

class _RandomProfileState extends State<RandomProfile> {
  late Future<ExploreProfile?> _fetchUserProfileService;

  @override
  void initState() {
    super.initState();
    _fetchUserProfileService = RandomProfileService().explorePosts(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const UserProfileFirstSectionA(),
          RandomProfilesecond(
            fetchUserProfileService: _fetchUserProfileService,
          ),
          Expanded(
            child: FutureBuilder<ExploreProfile?>(
              future: _fetchUserProfileService,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('ReLogin: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  // final ExploreProfile? posts = snapshot.data;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 4,
                            childAspectRatio: 0.7),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      // final ExploreProfile post = posts[index];
                      return Center(
                        child: Text("Sorry Private Profile"),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No posts available'),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
