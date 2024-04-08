import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:socialmedia_app/application/screens/Login/widget/gradient.dart';
import 'package:socialmedia_app/application/screens/Login/widget/login_screen_textfield.dart';
import 'package:socialmedia_app/application/screens/search/widgets/before_search.dart';
import 'package:socialmedia_app/application/screens/search/widgets/search_idle.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';
import 'package:socialmedia_app/data/apiservice/searchservice/search_sevice.dart';
import 'package:socialmedia_app/data/model/search/search_model/search_model.dart';

// ignore: must_be_immutable
class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  TextEditingController searchController = TextEditingController();
  List<SearchModel>? searchResults;
  Timer? _debouncer;

  onSearchChanged(String query) {
    if (_debouncer?.isActive ?? false) _debouncer?.cancel();
    _debouncer = Timer(const Duration(milliseconds: 500), () {
      SearchService().fetchSearchResult(query).then((SearchModel? searchModel) {
        if (searchModel != null) {
          setState(() {
            searchResults = [searchModel];
          });

          print(searchModel
              .toMap()); // This will print the details of the SearchModel instance
        }
        if (query.isEmpty) {
          setState(() {
            searchResults = null;
          });
          return;
        } else {
          print('SearchModel is null');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackGround(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              sHeight50,
              sHeight20,
              CustomTextFielsWidget(
                hint: "Search",
                fieldIcon: Icons.search,
                controller: searchController,
                radius: 30,
                onchange: (value) {
                  onSearchChanged(value);
                  log(value);
                },
                shadow: const [
                  BoxShadow(
                      blurStyle: BlurStyle.inner,
                      color: Colors.black,
                      blurRadius: 5,
                      spreadRadius: 0.2)
                ],
              ),
              searchResults != null
                  ? SearchIdle(
                      searchResults: searchResults,
                    )
                  : const BeforeSearch()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debouncer?.cancel();
    super.dispose();
  }
}
