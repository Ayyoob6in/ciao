import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmedia_app/application/blocs/Like/like_bloc.dart';
import 'package:socialmedia_app/application/blocs/homebloc/bloc/home_bloc.dart';
import 'package:socialmedia_app/application/screens/home/widgets/home_card.dart';
import 'package:socialmedia_app/application/screens/Login/widget/gradient.dart';
import 'package:socialmedia_app/data/apiservice/explore/explore_service.dart';
import 'package:socialmedia_app/data/apiservice/like/like_service.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeBloc(UserExploreService())..add(FetchExplorePostEvent()),
          child: Container(),
        ),
        BlocProvider(
            create: ((context) =>
                LikeBloc(userLikeService: UserLikeService())..userLikeService))
      ],
      child: Scaffold(
        body: GradientBackGround(
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ciao",
                      style: GoogleFonts.abyssinicaSil(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(child:
                    BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(
                            "assets/Animation - 1712558320897 (1).gif"),
                      )),
                    );
                  } else if (state is HomeLoadedState) {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.explorePost.afterExecution!.length,
                        itemBuilder: ((context, index) {
                          final posts =
                              state.explorePost.afterExecution![index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: HomeCard(
                                cardPost: posts.mediaUrls![0],
                                cardProfile:
                                    "assets/Animation - 1712480074591.gif",
                                cardLikePressed: () {
                                  BlocProvider.of<LikeBloc>(context).add(
                                    LikePostEvent(
                                        postId: posts.postid.toString()),
                                  );
                                },
                                cardCommentPressed: () {},
                                sharePressed: () {},
                                cardProfileName: "${posts.username}",
                                cardDescription: "${posts.caption}",
                                cardPostTime: "${posts.postAge}",
                                cardcomments: "${posts.commentsCount}",
                                cardlikes: "${posts.likesCount}",
                                cardMorePressed: () {}),
                          );
                        }));
                  } else if (state is HomeErrorState) {
                    return const Center(
                      child: Text("No data Avilable"),
                    );
                  } else {
                    return const Center(
                      child: Text("Something Went Wrong"),
                    );
                  }
                }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
