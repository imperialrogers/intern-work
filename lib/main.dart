import 'package:demo/freezed-getx/pages/home_screen.dart';
import 'package:demo/pages/hashtag_page.dart';
import 'package:demo/reels-scroller/reels_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: () async {
                  // var response =
                  //     await Dio().get('https://fakestoreapi.com/products');
                  // List list = response.data;
                  // List<Product> _products =
                  //     list.map((e) => Product.fromJson(e)).toList();
                  // Get.to(
                  //   ListScreen(
                  //     plist: _products,
                  //   ),
                  // );
                  // Get.to(ReelsScreen());
                  Get.to(HomeScreen());
                },
                child: Text("Press"))),
      ),
    );
  }
}
