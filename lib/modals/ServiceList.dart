class ServiceList {
  String title;
  double star;
  int ratings;
  double price;
  bool isAdded;

  ServiceList({
    required this.title,
    required this.star,
    required this.ratings,
    required this.price,
    this.isAdded = false,
  });
}
