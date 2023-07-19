import 'package:demo/comments/reply_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../comments/comment_model.dart';
import 'comment_controller.dart';

CommentsController commentsList = Get.put(CommentsController());

//Comment sheet
void showBottomSheets(BuildContext context) {
  final MediaQueryData mediaQueryData = MediaQuery.of(context);
  final double heightOfDevice = mediaQueryData.size.height;
  TextEditingController commentController = TextEditingController();

  //*****************Displaying bottom sheet
  showModalBottomSheet(
    isScrollControlled: true,
    enableDrag: true,
    showDragHandle: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    backgroundColor: const Color.fromARGB(255, 243, 241, 241),
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return FractionallySizedBox(
            heightFactor: 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Reactions',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: heightOfDevice * 0.56,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: commentsList.comments.length,
                    itemBuilder: (context, index) {
                      print(commentsList.comments.length);
                      return Obx(
                        () => _commentAndReplies(
                          index: index,
                          commentData: commentsList.comments[index],
                        ),
                      );
                    },
                  ),
                ),

                //TextField
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: commentController,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            hintText: "Add comment.......",
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
                          if (commentController.text != "" &&
                              commentController.text.isNotEmpty) {
                            setState(() {
                              commentsList
                                  .insertComment(commentController.text);
                            });
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
                ),
              ],
            ),
          );
        },
      );

      //
    },
  );
}

//************Rendering Comments and their sub comments
class _commentAndReplies extends StatelessWidget {
  final int index;
  final CommentModel commentData;
  const _commentAndReplies(
      {super.key, required this.index, required this.commentData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        child: Column(
          children: [
            _SingleComment(
              index: index,
            )
          ],
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5.0,
          ),
          //Listing Replies Code
          ...commentData.replies
              .map(
                (reply) => Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: _SingleReply(
                    index: index,
                    reply: reply,
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

///************Rendering of Single Comment
class _SingleComment extends StatelessWidget {
  final int index;
  // final CommentModel commentData;

  const _SingleComment({required this.index});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //User Info Widget
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 10.0,
                          left: 20,
                        ),
                        //Image of commenter
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/user.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Show Name of the commenter
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 1.0,
                                  ),
                                  child: Text(
                                    commentsList.comments[index].user,
                                    softWrap: true,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Text(
                                  " - 2w ago",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),

                            // comment
                            Text(
                              commentsList.comments[index].comment,
                              softWrap: true,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  showReplySheet(context, index);
                                });
                              },
                              child: const Text(
                                "Reply",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        //Like Button Rendered
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              // Like the post
                              setState(
                                () {
                                  commentsList.likeComment(index);
                                },
                              );
                            },
                            // Favorite icon
                            child:
                                (commentsList.comments[index].isLiked == false)
                                    ? const Icon(Icons.favorite_border_outlined)
                                    : const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                          ),
                        ),
                        // Number of likes
                        Obx(
                          () => Text(
                            commentsList.comments[index].likes.toString(),
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

///************Rendering of Single Reply
class _SingleReply extends StatelessWidget {
  final ReplyModel reply;
  final int index;

  const _SingleReply({required this.reply, required this.index});

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //User Info Widget
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          right: 10.0,
                          left: 20,
                        ),
                        //Image of commenter
                        child: CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/images/user.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Show Name of the commenter
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 1.0,
                                  ),
                                  child: Text(
                                    reply.user,
                                    softWrap: true,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Text(
                                  " - 2w ago",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),

                            // comment
                            Text(
                              reply.comment,
                              softWrap: true,
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                showReplySheet(context, index);
                                setState(() {});
                              },
                              child: const Text(
                                "Reply",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        //Like Button Rendered
                        GestureDetector(
                          onTap: () {
                            // Like the post
                            setState(
                              () {
                                commentsList.likeReply(reply);
                              },
                            );
                          },
                          // Favorite icon
                          child: (reply.isLiked == false)
                              ? const Icon(Icons.favorite_border_outlined)
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                        ),

                        // Number of likes
                        Text(
                          reply.likes.toString(),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
