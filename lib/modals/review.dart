class Review {
  final String name;
  final String Comment;
  final String CRLNo;
  final String CRBNo;
  final String reply;
  bool viewReply;
  Review(
      {required this.name,
      required this.CRLNo,
      required this.reply,
      required this.Comment,
      required this.CRBNo,
      required this.viewReply});
}
