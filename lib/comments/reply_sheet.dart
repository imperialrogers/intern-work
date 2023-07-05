//Reply Sheet
import 'package:demo/comments/comment_model.dart';
import 'package:demo/comments/comment_sheet.dart';
import 'package:flutter/material.dart';

void showReplySheet(BuildContext context, int index) {
  TextEditingController replyController = TextEditingController();
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.07,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: "Replying to @Amelia Dorsey",
                  border: InputBorder.none,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                elevation: 0,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
              ),
              child: const Icon(
                Icons.emoji_emotions_outlined,
                size: 25,
                color: Colors.blue,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (replyController.text.isNotEmpty) {
                  ReplyModel reply = ReplyModel(
                    isLiked: false,
                    likes: 0,
                    user: "Me",
                    comment: replyController.text,
                    time: DateTime.now(),
                  );
                  comments.comments[index].replies.add(reply);
                }
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
              ),
              child: const Icon(Icons.send, size: 20),
            ),
          ],
        ),
      );
    },
  );
}
