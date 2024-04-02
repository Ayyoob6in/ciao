import 'package:flutter/material.dart';

class BeforeSearch extends StatelessWidget {
  const BeforeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.95,
                crossAxisSpacing: 3,
                mainAxisSpacing: 5,
                crossAxisCount: 3),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    "https://images.pexels.com/photos/16652251/pexels-photo-16652251/free-photo-of-woman-standing-with-camera-among-flowers.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }));
  }
}
