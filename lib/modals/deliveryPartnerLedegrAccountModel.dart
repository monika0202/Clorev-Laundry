class LedgerAccountDP {
  final String date;
  final List<BookingsDp> bookingLists;
  final int totalBookingServed;
  final double incentive;

  LedgerAccountDP({
    required this.date,
    required this.bookingLists,
    required this.totalBookingServed,
    required this.incentive,
  });
}

class BookingsDp {
  final String BookingID;
  final String type;
  BookingsDp({
    required this.BookingID,
    required this.type,
  });
}
