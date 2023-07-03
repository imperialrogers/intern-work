import 'package:demo/freezed-getx/widgets/demo_values.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 330,
      child: Card(
        child: Column(children: [
          _PostDetails(),
          _Post(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        Icon(Icons.remove_red_eye_outlined),
                        Text("1687")
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [Icon(Icons.favorite), Text("1687")],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [Icon(Icons.whatshot), Text("")],
                    ),
                  ],
                ),
                Icon(Icons.bookmark)
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class _Post extends StatelessWidget {
  const _Post();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 3,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 150,
            child: _PostImage(),
          ),
          _PostTitleAndSummary()
        ],
      ),
    );
  }
}

class _PostTitleAndSummary extends StatelessWidget {
  const _PostTitleAndSummary();

  @override
  Widget build(BuildContext context) {
    final String summary = DemoValues.postSummary;

    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            summary,
          ),
        ],
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: Image.network(
        DemoValues.postImage,
        fit: BoxFit.fitWidth,
      ),
    ));
  }
}

class _PostDetails extends StatelessWidget {
  const _PostDetails();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: const Row(
        children: <Widget>[
          _UserImage(),
          SizedBox(
            width: 10,
          ),
          _UserNameAndEmail()
        ],
      ),
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(DemoValues.Name),
          Text(DemoValues.Residence),
        ],
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CircleAvatar(
        backgroundImage: AssetImage(DemoValues.userImage),
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  const PersonCard();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: Card(
        child: Column(
          children: [
            _Post(),
          ],
        ),
      ),
    );
  }
}
