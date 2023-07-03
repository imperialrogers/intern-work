// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class HashTagTile extends StatelessWidget {
  const HashTagTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color.fromARGB(255, 243, 241, 241),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color.fromARGB(255, 234, 233, 233),
          ),
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        child: ListTile(
          title: Text(
            "#9yearsofCongress",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageStack(),
              SizedBox(
                height: 10,
              ),
              Text("Trending Locally"),
            ],
          ),
          trailing: SizedBox(
            width: 120,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/user.jpg",
                    width: 60,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.add_box_outlined)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageStack extends StatelessWidget {
  const ImageStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: 100,
      height: 50,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                'https://media.istockphoto.com/photos/side-view-of-one-young-woman-picture-id1134378235?k=20&m=1134378235&s=612x612&w=0&h=0yIqc847atslcQvC3sdYE6bRByfjNTfOkyJc5e34kgU=',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 225, 225, 225)),
                width: 30,
                height: 30,
                child: Icon(
                  Icons.more_horiz,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
