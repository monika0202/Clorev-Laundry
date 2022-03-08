class ClosedBookingsDP {
  String bookingID;
  String time;
  List<ListItems> listItems;

  ClosedBookingsDP({
    required this.bookingID,
    required this.time,
    required this.listItems,
  });
}

class ListItems {
  List<String> type;
  String date;
  String time;

  ListItems({
    required this.type,
    required this.date,
    required this.time,
  });
}
