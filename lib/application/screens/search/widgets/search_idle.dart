import 'package:flutter/material.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 15,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 70,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Colors.white, blurRadius: 0.3)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blueAccent),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          height: 70,
                          width: 61,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              shape: BoxShape.circle),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                              "https://images.pexels.com/photos/20568187/pexels-photo-20568187/free-photo-of-mehrazin.jpeg?auto=compress&cs=tinysrgb&w=800&lazy=load",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Granger",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {}, child: const Text("Follow"))
                      ],
                    )),
              );
            }));
  }
}
