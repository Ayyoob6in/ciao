// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialmedia_app/application/blocs/postbloc/post_bloc_bloc.dart';
import 'package:socialmedia_app/application/screens/login/widget/gradient.dart';
import 'package:socialmedia_app/application/screens/navbar/navbar.dart';
import 'package:socialmedia_app/application/screens/post/widgets/post_buttons.dart';
import 'package:socialmedia_app/core/constants/contstant.dart';
import 'package:socialmedia_app/data/apiservice/post_service.dart';

// ignore: must_be_immutable
class ScreenPost extends StatelessWidget {
  ScreenPost({super.key});

  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<XFile> images = [];

  @override
  Widget build(BuildContext context) {
    final postBloc = BlocProvider.of<PostBlocBloc>(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue[400],
          title: Text(
            'CREATE POST',
            style: GoogleFonts.notoSansHebrew(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                  BoxShadow(color: Colors.black, spreadRadius: 3, blurRadius: 3)
                ])),
          ),
        ),
        body: GradientBackGround(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 810,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.white,
                          blurRadius: 1.5,
                          spreadRadius: 0.7)
                    ],
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Column(
                    children: [
                      Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () async {
                                final ImagePicker _picker = ImagePicker();
                                images = await _picker.pickMultiImage();
                                postBloc.add(OnSelectedImageEvent(images));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 450,
                                decoration: BoxDecoration(
                                    color: Colors.blue[400],
                                    border: Border.all(
                                        color: Colors.white, width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.white,
                                          blurRadius: 0.5,
                                          spreadRadius: 0.5)
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: BlocBuilder<PostBlocBloc, PostBlocState>(
                                  builder: (context, state) => state.images !=
                                          null
                                      ? ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          itemCount: state.images!.length,
                                          itemBuilder: (ctx, index) =>
                                              Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 5, right: 5),
                                                  height: 230,
                                                  width: 300,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.blueAccent,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    child: Image.file(
                                                      File(
                                                        state.images![index]
                                                            .path,
                                                      ),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )))
                                      : const Icon(
                                          Icons.camera_alt,
                                          size: 50,
                                          color: Colors.black,
                                        ),
                                ),
                              )),
                        ),
                      ]),
                      Expanded(
                          child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white54, //
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Form(
                                key: _formKey,
                                child: TextFormField(
                                  controller: descriptionController,
                                  maxLines: 4,
                                  style:
                                      const TextStyle(color: Colors.blueAccent),
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Your Description here',
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(16.0),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter Description ";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ),
                          sHeight20,
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  PostButtons(
                                      buttonPress: () {
                                        descriptionController.clear();
                                      },
                                      buttonNAme: "CANCEL"),
                                  PostButtons(
                                    buttonPress: () async {
                                      if (_formKey.currentState!.validate()) {
                                        final String caption =
                                            descriptionController.text;
                                        final List<String> mediaUrls = images
                                            .map((image) => image.path)
                                            .toList();
                                        try {
                                          await PostService.createPost(
                                              caption, mediaUrls);
                                          // ignore: avoid_print
                                          print("success");
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text(
                                                  'Post created successfully'),
                                            ),
                                          );
                                        } catch (e) {
                                          // ignore: avoid_print
                                          print(e.toString());
                                          // ignore: duplicate_ignore
                                          // ignore: use_build_context_synchronously
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text("Success"),
                                            ),
                                          );
                                          // ignore: duplicate_ignore
                                          // ignore: use_build_context_synchronously
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ScreenNavigation()));
                                        }
                                      }
                                    },
                                    buttonNAme: "POST",
                                  ),
                                ]),
                          )
                        ],
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
