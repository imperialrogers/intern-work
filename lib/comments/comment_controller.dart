import 'package:demo/comments/comment_model.dart';
import 'package:demo/comments/comment_sheet.dart';
import 'package:get/get.dart';

List<CommentModel> dummyList = [
  CommentModel(
    likes: 0,
    replies: [
      ReplyModel(
        likes: 0,
        user: "Jack Jacob",
        comment: "Yeah true!! It's fantastic !!!",
        time: DateTime.now(),
        isLiked: false,
      ),
    ],
    user: "Amelia Dorsey",
    comment:
        "Its so informative!! Appreciate it.\nContains very useful information.",
    time: DateTime.now(),
    isLiked: false,
  ),
];

class CommentsController extends GetxController {
  RxList<CommentModel> comments = dummyList.obs;

  void likeComment(int index) {
    try {
      if (commentsList.comments[index].isLiked == false) {
        commentsList.comments[index].isLiked =
            !commentsList.comments[index].isLiked;
        commentsList.comments[index].likes += 1;
      } else {
        commentsList.comments[index].isLiked =
            !commentsList.comments[index].isLiked;
        commentsList.comments[index].likes -= 1;
      }
    } catch (e) {
      print(e);
    }

    print(commentsList.comments[index].likes);
  }

  void likeReply(ReplyModel reply) {
    try {
      if (reply.isLiked == false) {
        reply.isLiked = !reply.isLiked;
        reply.likes += 1;
      } else {
        reply.isLiked = !reply.isLiked;
        reply.likes -= 1;
      }
    } catch (e) {
      print(e);
    }

    print(reply.likes);
  }

  void insertComment(String content) {
    CommentModel comment = CommentModel(
      isLiked: false,
      likes: 0,
      replies: [],
      user: "Me",
      comment: content,
      time: DateTime.now(),
    );
    comments.add(comment);
    print(dummyList.length);
  }

  void insertReply(String content, int index) {
    ReplyModel reply = ReplyModel(
      isLiked: false,
      likes: 0,
      user: "Me",
      comment: content,
      time: DateTime.now(),
    );
    comments[index].replies.add(reply);
    print(comments[index].replies.length);
  }
}
