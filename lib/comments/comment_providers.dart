import 'package:demo/comments/comment_model.dart';
import 'package:demo/comments/comment_sheet.dart';

List<CommentModel> commentList = [
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

void likeReply(CommentModel comment) {
  try {
    if (comment.isLiked == false) {
      comment.isLiked = !comment.isLiked;
      comment.likes += 1;
    } else {
      comment.isLiked = !comment.isLiked;
      comment.likes -= 1;
    }
  } catch (e) {
    print(e);
  }

  print(comment.likes);
}

void addComment(String content) {
  CommentModel comment = CommentModel(
    isLiked: false,
    likes: 0,
    replies: [],
    user: "Me",
    comment: content,
    time: DateTime.now(),
  );
  commentList.insert(0, comment);
  print(commentList.length);
}

void addReply(String content, int index) {
  ReplyModel reply = ReplyModel(
    isLiked: false,
    likes: 0,
    user: "Me",
    comment: content,
    time: DateTime.now(),
  );
  comments.comments[index].replies.insert(0, reply);
}
