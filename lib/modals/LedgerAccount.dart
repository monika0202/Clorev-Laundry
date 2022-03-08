class LedgerAccount {
  final String date;
  final List<BookingList> bookingLists;
  final double totalBookingAmount;
  final double totalGST;
  final double clorevShare;
  final double gstOnClorevShare;
  final double netPayableAmount;

  LedgerAccount({
    required this.date,
    required this.bookingLists,
    required this.totalBookingAmount,
    required this.totalGST,
    required this.clorevShare,
    required this.gstOnClorevShare,
    required this.netPayableAmount,
  });
}

class BookingList {
  final String bookingID;
  final double price;

  BookingList({
    required this.bookingID,
    required this.price,
  });
}
