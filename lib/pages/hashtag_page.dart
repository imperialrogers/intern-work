import 'package:demo/pages/widgets/hashtag_tile.dart';
import 'package:flutter/material.dart';

import '../comments/comment_sheet.dart';

class HashTagPage extends StatelessWidget {
  const HashTagPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: NavigationBar(
            backgroundColor: Colors.white,
            destinations: const [
              Padding(
                padding: EdgeInsets.only(
                  left: 50.0,
                  top: 30,
                ),
                child: Text("Trending"),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 50.0,
                  top: 30,
                ),
                child: Text("Topics"),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 40.0,
                  top: 30,
                ),
                child: Text("News"),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 243, 241, 241),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) => const HashTagTile(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(221, 63, 63, 63),
        onPressed: () {
          showBottomSheets(context);
        },
        child: const Icon(Icons.add_outlined, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
