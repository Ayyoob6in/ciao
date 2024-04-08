import 'package:flutter/material.dart';
import 'package:socialmedia_app/core/constants/constant_color.dart';
import 'package:socialmedia_app/data/apiservice/follow/follow_service.dart';
import 'package:socialmedia_app/data/apiservice/unfollow/unfollow_service.dart';
import 'package:socialmedia_app/data/model/search/search_model/search_model.dart';

class SearchIdle extends StatefulWidget {
  SearchIdle({
    Key? key,
    required this.searchResults,
  }) : super(key: key);

  final List<SearchModel>? searchResults;

  @override
  _SearchIdleState createState() => _SearchIdleState();
}

class _SearchIdleState extends State<SearchIdle> {
  late List<bool> isFollowingList;

  @override
  void initState() {
    super.initState();
    // Initialize isFollowingList with false values for each user initially
    isFollowingList = List.generate(widget.searchResults!.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.searchResults!.length,
        itemBuilder: (context, index) {
          final searchModel = widget.searchResults![index];
          final isFollowing =
              isFollowingList[index]; // Get isFollowing status for current user

          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              padding: const EdgeInsets.all(5),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.white, blurRadius: 0.3),
                ],
                borderRadius: BorderRadius.circular(10),
                color: appColor,
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    height: 70,
                    width: 61,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/Animation - 1712480074591.gif",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          searchModel.afterExecution![index].name.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          searchModel.afterExecution![index].username
                              .toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Toggle isFollowing status for the current user
                        isFollowingList[index] = !isFollowing;
                        if (isFollowing) {
                          UnFollowService().unFollow(searchModel
                              .afterExecution![index].userid
                              .toString());
                        } else {
                          FollowService().followUser(searchModel
                              .afterExecution![index].userid
                              .toString());
                        }
                      });
                    },
                    child: Text(isFollowing ? "UnFollow" : "Follow"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
