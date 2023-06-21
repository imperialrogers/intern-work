// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:demo/post_card.dart';
import 'package:demo/text_screen.dart';
import 'package:flutter/material.dart';
import 'demo_values.dart';
import 'post_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Janta24"),
          centerTitle: true,
          actions: [
            // GestureDetector(onTap: () {}, child: Icon(Icons.more_horiz)),
            DropdownButton<String>(
              items: <String>['Account', 'Report', 'Block'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.notifications_outlined),
          ],
        ),
        drawer: Drawer(),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 30,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              height: 50,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Text("#startup",
                                  style: TextStyle(fontSize: 12)),
                            ),
                            SizedBox(
                              width: 30,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) => PostCard(),
                  ),
                  Container(
                    height: 150,
                    padding: EdgeInsets.all(8),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Container(
                              height: 150,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: SizedBox(
                                width: 90,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(DemoValues.userImage),
                                      ),
                                    ),
                                    Text("Hina Naaz"),
                                    Text(
                                      "Hyderabad,Telangana",
                                      style: TextStyle(fontSize: 8),
                                    ),
                                    Text(
                                      "886 Followers",
                                      style: TextStyle(fontSize: 8),
                                    ),
                                    ElevatedButton(
                                        onPressed: null,
                                        child: Text(
                                          "Follow",
                                          style: TextStyle(
                                            fontSize: 8,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) => PostCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Icon(Icons.home),
              ),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => TextScreen()));
                    },
                    child: Icon(Icons.search)),
              ),
              FloatingActionButton(
                onPressed: null,
                tooltip: 'Increment',
                child: Icon(Icons.add),
              ),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TextScreen()));
                    },
                    child: Icon(Icons.video_call_outlined)),
              ),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TextScreen()));
                    },
                    child: Icon(Icons.person_outline)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
