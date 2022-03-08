class NotificationModel {
  final String title;
  final String content;
  final String date;
  final String time;
  bool isbookmarked;

  NotificationModel(
      {required this.content,
      required this.date,
      required this.title,
      required this.time,
      required this.isbookmarked});
}
