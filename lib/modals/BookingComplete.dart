class BookingComplete {
  final String bookingID;
  final String Date;
  final String status;
  final String Item;
  final String deliveredDate;
  final String serviceProviderId;
  double? rating;

  BookingComplete({
    required this.bookingID,
    required this.Date,
    required this.Item,
    required this.status,
    required this.deliveredDate,
    required this.serviceProviderId,
    required this.rating,
  });
}
