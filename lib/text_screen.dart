import 'package:demo/home_screen.dart';
import 'package:flutter/material.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(child: Text("Other Screen")),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Icon(Icons.home)),
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => TextScreen()));
                  },
                  child: Icon(Icons.search)),
            ),
            FloatingActionButton(
              onPressed: null,
              tooltip: 'Increment',
              child: Icon(Icons.add),
              foregroundColor: Colors.blue,
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => TextScreen()));
                  },
                  child: Icon(Icons.video_call_outlined)),
            ),
            Expanded(
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => TextScreen()));
                  },
                  child: Icon(Icons.person_outline)),
            ),
          ],
        ),
      ),
    );
  }
}
