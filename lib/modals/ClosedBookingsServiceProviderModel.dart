class ClosedBookings {
  String bookingID;
  String time;
  List<ListItem> listItems;
  int totalItems;
  double totalPrice;

  ClosedBookings({
    required this.bookingID,
    required this.time,
    required this.listItems,
    required this.totalItems,
    required this.totalPrice,
  });
}

class ListItem {
  String type;
  String date;

  ListItem({
    required this.type,
    required this.date,
  });
}
