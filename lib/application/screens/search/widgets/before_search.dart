import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia_app/application/blocs/homebloc/bloc/home_bloc.dart';
import 'package:socialmedia_app/data/apiservice/explore/explore_service.dart';

class BeforeSearch extends StatelessWidget {
  const BeforeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(UserExploreService())..add(FetchExplorePostEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeLoadedState) {
            return Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.95,
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 5,
                            crossAxisCount: 3),
                    itemCount: state.explorePost.afterExecution!.length,
                    itemBuilder: (context, index) {
                      final post = state.explorePost.afterExecution![index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: FadeInImage.assetNetwork(
                                placeholderColor: Colors.transparent,
                                placeholder:
                                    "assets/63CC70DE-A50D-43FB-AF26-85AE64780040.png",
                                fit: BoxFit.cover,
                                image: post.mediaUrls![0])),
                      );
                    }));
          } else {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
        },
      ),
    );
  }
}
