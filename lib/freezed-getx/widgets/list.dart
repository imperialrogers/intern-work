import 'package:demo/freezed-getx/widgets/product.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  ListScreen({
    super.key,
    required this.plist,
  });
  final List<Product> plist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: (plist.length == 0) ? 2 : plist.length,
          itemBuilder: (context, index) {
            return Card(
              child: Container(
                height: 100,
                width: 200,
                child: ListTile(
                  title: Text(plist[index].title),
                  subtitle: Text(plist[index].price.toString()),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
