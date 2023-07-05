class CommentModel {
  final String user;
  final String comment;
  final DateTime time;
  final List<ReplyModel> replies;
  int likes;
  bool isLiked;

  CommentModel({
    required this.isLiked,
    required this.likes,
    required this.replies,
    required this.user,
    required this.comment,
    required this.time,
  });
}

class ReplyModel {
  final String user;
  final String comment;
  final DateTime time;
  int likes;
  bool isLiked;

  ReplyModel({
    required this.isLiked,
    required this.likes,
    required this.user,
    required this.comment,
    required this.time,
  });
}
