// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:demo/pages/widgets/hashtag_tile.dart';
import 'package:flutter/material.dart';

class HashTagPage extends StatelessWidget {
  const HashTagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: NavigationBar(
            backgroundColor: Colors.white,
            destinations: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 50.0,
                  top: 30,
                ),
                child: Text("Trending"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50.0,
                  top: 30,
                ),
                child: Text("Topics"),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  top: 30,
                ),
                child: Text("News"),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 243, 241, 241),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => HashTagTile(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_outlined, size: 30),
        backgroundColor: Color.fromARGB(221, 63, 63, 63),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class AppBarContent extends StatelessWidget {
  const AppBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.end,
    //   children: <Widget>[
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10),
    //       child: Row(
    //         children: <Widget>[
    //           Text("Trending"),
    //           Spacer(),
    //           Text("Trending"),
    //           Spacer(),
    //           Text("Trending"),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "add"),
      ]),
    );
  }
}
