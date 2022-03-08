class BookedList {
  final String category;
  final String title;
  final String description;
  final int quantity;
  final int price;

  bool isPhotoClicked;

  BookedList({
    required this.category,
    required this.price,
    required this.title,
    required this.quantity,
    required this.description,
    this.isPhotoClicked = false,
  });
}
