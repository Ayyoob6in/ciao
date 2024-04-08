import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia_app/application/screens/userprofile/widgets/user_profile_section.dart';
import 'package:socialmedia_app/application/screens/userprofile/widgets/userprofile_second.dart';
import 'package:socialmedia_app/data/apiservice/deletepost/delete_post_service.dart';
import 'package:socialmedia_app/data/apiservice/fetchpost/fetch_post.dart';
import 'package:socialmedia_app/data/apiservice/profile_service.dart';
import 'package:socialmedia_app/data/model/fetch_post/fetch_post.dart';
import 'package:socialmedia_app/data/model/profile/profile.dart'; // Import your Post model

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late Future<List<Post>> _fetchPostService;
  late Future<UserData?> _fetchUserProfileService;
  @override
  void initState() {
    super.initState();
    _fetchPostService = FetchPostService().fetchPosts();
    _fetchUserProfileService = ProfileApiService().fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const UserProfileFirstSection(),
          UserProfileSecondSection(
            fetchUserProfileService: _fetchUserProfileService,
          ),
          Expanded(
            child: FutureBuilder<List<Post>>(
              future: _fetchPostService,
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
                  final List<Post> posts = snapshot.data!;
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 4,
                            childAspectRatio: 0.7),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final Post post = posts[index];
                      return Card(
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              post.caption,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            Text(
                              post.postAge,
                              style: const TextStyle(color: Colors.black54),
                            ),
                            IconButton(
                              onPressed: () async {
                                try {
                                  await DeletePostService()
                                      .deletePost('${post.postId}');
                                  setState(() {
                                    _fetchPostService =
                                        FetchPostService().fetchPosts();
                                    _fetchUserProfileService =
                                        ProfileApiService().fetchUserProfile();
                                  });
                                } catch (e) {
                                  print(e.toString());
                                }
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                            ),
                            // Conditional rendering based on the number of images
                            if (post.mediaUrls.length == 1)
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.transparent,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    post.mediaUrls
                                        .first, // Display the first image
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            else
                              CarouselSlider(
                                options: CarouselOptions(
                                  height: 200,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  aspectRatio: 16 / 9,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enableInfiniteScroll: true,
                                ),
                                items: post.mediaUrls.map((url) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.black26),
                                        height: 200,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            url,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                          ],
                        ),
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
